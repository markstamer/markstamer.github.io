import Foundation
import Ignite

struct Footer: Component {
    public func body(context: PublishingContext) -> [any PageElement] {
        Group {
            Text {
                Image(systemName: "c-circle")

                "2024 Mark Stamer"

                Image(systemName: "dot")

                Link("Legal notice", target: Imprint())
                    .role(.secondary)
                    .linkStyle(.hover)

                Image(systemName: "dot")

                " Created with "

                Link("Ignite", target: URL("https://github.com/twostraws/Ignite"))
                    .role(.secondary)
                    .linkStyle(.hover)

                " using "

                Image(decorative: "images/swift_logo_white.svg")
                    .resizable()
                    .frame(height: "1.4em")
                    .margin(.bottom, -2)
                    .verticalAlignment(.textBottom)
            }
            .foregroundStyle(.tertiary)
        }
        .horizontalAlignment(.center)
        .margin(.top, .extraLarge)
    }
}
