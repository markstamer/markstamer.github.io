import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Mark Stamer"

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Spacer(size: .extraLarge)

            profileSection

            Spacer(size: .extraLarge)

            workSection
                .margin(.top, "80px")
                .id("work")

            articleSection(context.allContent)
                .margin(.top, "80px")
                .id("articles")
        }
        .frame(maxWidth: .containerWidth(.large))
    }
}
