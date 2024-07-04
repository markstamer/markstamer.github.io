import Foundation
import Ignite

struct Footer: Component {
    public func body(context: PublishingContext) -> [any PageElement] {
        Group {
            Group {
                Image.profile
                Spacer(size: .large)
                Text.socials
            }
            .horizontalAlignment(.center)
            .frame(maxWidth: 160)
            .margin(.top, .large)
            .width(3)

            Spacer(size: .large)

            Text {
                // Rights
                Image(systemName: "c-circle")
                "2024 Mark Stamer"

                Image(systemName: "dot")

                // Legal notice
                Link("Legal notice", target: Imprint())
                    .role(.secondary)
                    .linkStyle(.hover)

                Image(systemName: "dot")

                // Create with Ignite
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
