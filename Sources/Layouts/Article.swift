import Foundation
import Ignite

struct Article: ContentPage {
    func body(content: Content, context: PublishingContext) -> [any BlockElement] {
        Group {
            Text(content.title)
                .font(.title1)

            Text {
                for tag in content.tags {
                    Badge(tag)
                        .role(.success)
                        .badgeStyle(.subtle)
                        .verticalAlignment(.center)
                        .margin(.bottom, 4)
                }

                Image(systemName: "dot")
                    .padding(.horizontal, .small)

                content.date.formatted(date: .abbreviated, time: .omitted)

                Image(systemName: "dot")
                    .padding(.horizontal, .small)

                "\(content.estimatedReadingMinutes) min read"
            }
            .font(.title5)
            .fontWeight(.light)
            .padding(.vertical, .medium)

            if let image = content.image {
                Image(image, description: content.imageDescription)
                    .resizable()
                    .cornerRadius(20)
                    .aspectRation(3.5, contentMode: .fill)
                    .padding(.vertical, .medium)
            }

            Text(content.body)
        }
        .frame(maxWidth: .containerWidth(.large))
    }
}
