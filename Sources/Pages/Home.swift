import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    func body(context: PublishingContext) -> [BlockElement] {
        Spacer(size: .extraLarge)

        profileSection
            .frame(maxWidth: .containerWidth(.large))

        Spacer(size: .extraLarge)

        tagSection
            .frame(maxWidth: .containerWidth(.large))

        Spacer(size: .extraLarge)

        workSection
            .frame(maxWidth: .containerWidth(.large))
            .margin(.top, "80px")
            .id("work")

        articleSection(context.allContent)
            .frame(maxWidth: .containerWidth(.large))
            .margin(.top, "80px")
            .id("articles")

    }
}
