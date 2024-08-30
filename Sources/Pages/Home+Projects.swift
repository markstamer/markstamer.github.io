import Ignite

extension Home {
    var projectsSection: some BlockElement {
        Group {
            Text("Projects.")
                .font(.title1)
                .foregroundStyle(.secondary)

            Spacer(size: .extraLarge)

            Section {
                Card.projectCard(
                    image: "/images/projects/noisegauge-mockups.png",
                    title: "Noise Gauge",
                    text: Text("Inspired by a presentation about a circular noise gauge built in SwiftUI a while ago, I explored masks and gradients and built my own version. Recently, I revisited the code to develop a full-fledged noise level meter, which I hope to release on the App Store soon.")
                )
                .width(6)

                Card.projectCard(
                    image: "/images/projects/ignite-logo-padded.png",
                    title: "My Website",
                    text: Text {
                        "Just as I was planning to build my own website, Paul Hudson released "
                        Link("Ignite", target: "https://github.com/twostraws/Ignite")
                            .fontWeight(.semibold)
                            .linkStyle(.hover)
                            .role(.warning)
                        ", an open-source static site builder. Ignite enables users to create websites in Swift using a SwiftUI-like syntax. I quickly decided to try it out and soon began contributing to the project. My website is published using GitHub Pages. You can checkout the source code "
                        Link(" here", target: "https://github.com/markstamer/markstamer.github.io")
                            .fontWeight(.semibold)
                            .linkStyle(.hover)
                            .role(.warning)
                        "."
                    }
                )
                .width(6)
            }
        }
    }
}
