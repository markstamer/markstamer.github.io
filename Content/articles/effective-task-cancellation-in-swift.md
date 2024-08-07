---
author: Mark Stamer
layout: Article
tags: async/await
image: /images/articles/any-cancellable.jpeg
externalLink: Medium https://medium.com/mobimeo-technology/effective-task-cancellation-in-swift-by-leveraging-combines-anycancellable-7814b50fc8c8
date: 2023-06-23 9:30
---
# Effective Task cancellation in Swift by leveraging Combine’s AnyCancellable

When I first saw async/await Swift code, I was amazed at how elegant and concise it was. In practice, however, I often found that I had to wrap asynchronous functions in a `Task` to be able to cancel them. This meant keeping a reference to each individual task, which can quickly become tedious, especially since they involve generics. In this article I will explore ways to improve the ergonomics of task cancellation by leveraging Combine's `AnyCancellable`.

### Cancellation in Swift concurrency

Before we get into the weeds, let’s briefly recap how cancellation in Swift concurrency works. The [Swift Programming Language](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/) book states that Swift concurrency uses a cooperative cancellation model. This means that although all child tasks will be informed when their parent task has been canceled, they still continue to run. A task can check whether it has been canceled by either calling `try Task.checkCancellation()`, which raises a `CancellationError`, or by checking the value of `Task.isCanceled` to return a partial result or a fallback value. Lastly, a task can be canceled by calling the `cancel()` method on it.

> **NOTE**: With URLSession's asynchronous APIs, it is not necessary to check for cancellation since a `URLError` with the code `canceled` will be thrown.

### Task cancellation

Lets look at a simple example of task cancellation. The below view model can load a model from the network and expose different states through a published state property:

```swift
class FoodViewModel: ObservableObject {
    enum State {
        case idle, loading, vegetable(Vegetable), error(Error)
    }

    @Published private(set) var state: State = .idle

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func displayVegetable(id: String) async {
        do {
            state = .loading
            state = try await .vegetable(loadVegetable(id: id))
        } catch let error as URLError where error.code == .cancelled {
            state = .idle
        } catch {
            state = .error(error)
        }
    }

    private func loadVegetable(id: String) async throws -> Vegetable {
        try await networkService.request(endpoint: .vegetable(id: id))
    }
}
```

If this view model were to control a SwiftUI view and your app supports iOS 15.0+, the best approach is probably to call `displayVegetable()` from within SwiftUI's task modifier. It is called when the view first appears and is marked as canceled when the view is no longer displayed on screen. I suppose we could write our own task `ViewModifier` which starts a task in `onAppear` and cancels it again in `onDisappear` , but let’s look at ways to manually control the task lifetime instead. While we could expose a cancel method to the view that is called in `onDisappear`, arguably a more elegant approach is to tie the lifetime of the task to that of the view model:

```swift
class FoodViewModel: ObservableObject {
    ... 
  
    private var task: Task<Void, Never>? // Reference to the loading task

    deinit {
        task?.cancel() // Make sure the task is canceled if it is no longer needed
    }

    func displayVegetable(id: String) {
        task = Task { @MainActor [weak self] in
            guard let self else { return } // Captures self and prevents deinit before task is finished
            do {
                self.state = .loading
                self.state = try await .vegetable(self.loadVegetable(id: id))
            } catch ... {
                ...
            }
        }
    }
  
    ...
}
```

As you can see it get’s a little bit more involved. We now have to keep a reference of the task and make sure we cancel the task when the view model is de-initialized. However, there is only one problem with this code, `deinit` is not called. This is because we create a reference cycle by capturing a strong reference to `self` in the task’s closure in the `guard self` statement. Lets fix that by shaking off our guard-self-dance habit and guard the statement in the suspension point instead.

```swift
class FoodViewModel: ObservableObject {
    ... 
  
    private var task: Task<Void, Never>?

    deinit {
        task?.cancel()
    }

    func displayVegetable(id: String) {
        task = Task { @MainActor [weak self] in
            do {
                self?.state = .loading
                guard let vegetable = try await self?.loadVegetable(id: id) else {
                    return
                }
                self?.state = .vegetable(vegetable)
            } catch ... {
                ...
            }
        }
    }
}
```

### Single task cancellation using `AnyCancellable`

After having worked with Combine for a while, I was intuitively looking for something similar to `AnyCancellable` . It has the advantage of being automatically canceled by calling its cancel function as soon as there is no more reference to it. Let's create a simple extension on `Task` to make use of this.

```swift
import Combine

extension Task {
  func eraseToAnyCancellable() -> AnyCancellable {
        AnyCancellable(cancel)
    }
}
```

If you don’t use Combine in your App und you find it overkill to import it, you could easily create your own `AnyCancallable` class to provide the same cancellation functionality (see Appendix). With this in place we can omit the `deinit`and store an `AnyCancellable` instead of the task.

```swift
class FoodViewModel: ObservableObject {
    ... 
  
    private var cancellable: AnyCancellable?

    func displayVegetable(id: String) {
        cancellable = Task { @MainActor [weak self, networkService] in
            ...
        }.eraseToAnyCancellable()
    }
  
    ...
}
```

Another advantage of this approach is the ability to always use the same reference when you have requests that alternate. Let’s assume we have another function called `displayFruit(id:)` . If your view is only able to display either a fruit or vegetable you can use the same reference for both, and don't need to worry about cancelling the previous task.

```swift
class FoodViewModel: ObservableObject {
    ... 
  
    private var cancellable: AnyCancellable?

    // Canceled automatically if a fruit is requested
    func displayVegetable(id: String) {
        cancellable = Task { @MainActor [weak self, networkService] in
            ...
        }.eraseToAnyCancellable()
    }

   // Canceled automatically if a vegetable is requested
    func displayFruit(id: String) {
        cancellable = Task { @MainActor [weak self, networkService] in
            ...
        }.eraseToAnyCancellable()
    }
  
    ...
}
```

### Cancelling multiple tasks

Now that we have our first Combine-like API, we can take the next obvious step by introducing a function analogous to Combine's `store(in: Set<AnyCancellable>)`.

```swift
import Combine

extension Task {
    func store(in set: inout Set<AnyCancellable>) {
        set.insert(AnyCancellable(cancel))
    }
}
```

I personally love the simplicity of this syntax. It allows us to tie the lifecycle of multiple tasks to a single reference. And the best part is, it can be used alongside with publisher subscriptions as well. For example, if we go back to our single vegetable request scenario where, which is tied to the views lifecycle and we want to observe our apps user login state, we can conveniently store both cancellation handlers in a single set.

```swift
class FoodViewModel: ObservableObject {
    ... 
  
    private var cancellables: Set<AnyCancellable> = []

    init(networkService: NetworkService, userModule: UserModule) {
      self.networkService = networkService
      
      userModule.isLoggedInPublisher.sink { isLoggedIn in
          ...
      }
      .store(in: &cancellables)
    }

    func displayVegetable(id: String) {
        Task { @MainActor [weak self, networkService] in
            ...
        }.store(in: &cancellables)
    }
  
    ...
}
```

### Conclusion

In this article, we explored how we could improve the ergonomics of task cancellation by using `AnyCancellable` from Combine. By using it as a cancellation handler, we were able to link the lifecycle of a task to the lifecycle of its view model. It also allowed us to use the same cancellation reference for alternating tasks without requiring explicit cancellation. Finally, we created a way to conveniently store multiple task cancellation handlers in a single set and even mix and match them with publisher subscriptions.

I hope you found this article useful. If you have any comments or feedback, please feel free to write me on [Twitter](https://twitter.com/mIaIrIk). Thanks for reading!

***

### Appendix

```swift
final class AnyCancellable: Hashable {

    private let cancel: () -> Void

    init(_ cancel: @escaping () -> Void) {
        self.cancel = cancel
    }

    deinit {
        cancel()
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    static func == (lhs: AnyCancellable, rhs: AnyCancellable) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
```
