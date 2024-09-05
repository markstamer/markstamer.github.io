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
                        ", an open-source static site builder. Ignite enables you to create websites in Swift using a SwiftUI-like syntax. I quickly decided to go with it and soon began contributing to the project. My site is published using GitHub Pages. You can checkout the source code "
                        Link(" here", target: "https://github.com/markstamer/markstamer.github.io")
                            .fontWeight(.semibold)
                            .linkStyle(.hover)
                            .role(.warning)
                        "."
                    },
                    enableImageModal: false
                )
                .width(6)

                Card.projectCard(
                    image: "/images/projects/ar-hackathon.png",
                    title: "AR-based Vehicle Discovery Hackathon",
                    text: Text("Locating shared vehicles on the street, especially scooters and bikes, can be challenging as they are often hidden behind cars. During a 2023 hackathon at Mobimeo, I collaborated with Daniel Büker (Design), Meik Mense-Koch (Design), and Metin Güler (iOS) to build an iOS prototype that used augmented reality (AR) to make these vehicles more visible. When the user looked down at the phone, they would see a conventional map, but when the phone was held upright, a camera view would appear, displaying the vehicles as AR objects floating above the ground. It was exciting to explore this concept, but we quickly discovered that the GPS accuracy of the scooters was insufficient. Additionally, AR-based navigation proved to be a complex task and is already a well-developed feature in both Apple and Google Maps.")
                )
                .width(6)
            }
        }
    }
}
