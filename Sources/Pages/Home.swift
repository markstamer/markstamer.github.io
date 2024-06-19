import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    func body(context: PublishingContext) -> [BlockElement] {
        Spacer(size: .extraLarge)

        profileSection
            .frame(maxWidth: .containerWidth(.large))
            .margin(.top, "50px")

        Spacer(size: .extraLarge)

        tagSection
            .frame(maxWidth: .containerWidth(.large))
            .margin(.top, "100px")

        Spacer(size: .extraLarge)

        workSection
            .frame(maxWidth: .containerWidth(.large))
            .margin(.top, "100px")

    }
}
struct ShowBoxShadow: Action {
    func compile() -> String {
        "this.style.boxShadow='0px 0px 8px rgba(0, 0, 0, 0.1)'"
    }
}
struct HideBoxShadow: Action {
    func compile() -> String {
        "this.style.boxShadow=''"
    }
}

extension Group {
    static func empty(width: Int) -> Group {
        Group { }.width(width)
    }
}
