import Ignite

extension Home {
    var workSection: Section {
        Section {
            Group {
                Text("Work.")
                    .font(.title1)
                    .foregroundStyle(.secondary)

                Spacer(size: .extraLarge)

                // MARK: - Mobimeo / Moovel

                WorkCard(
                    title: "Mobimeo / Moovel",
                    image: "/images/work/Mobimeo-Mockups.png",
                    imageLayout: .right,
                    description: """
                    At Moovel, and subsequently at Mobimeo, I worked on integrating Mobility Service Providers (MSP) into white-label apps designed to offer multiple mobility options for urban travel in one place. My primary focus was developing discovery, booking, and trip search features for Sharing MSPs (Scooter-, Bike- and Car-Sharing) and occasionally for Ridehailing. For this, I built multiple dedicated packages within the modularized app architecture but I also took the opportunity to get involved in most other parts of the app over the years. A central theme, which spans across many features, was the visualization of vehicles, routes, or areas of operation on a map.
                    """,
                    keyFeaturesMarkdown: """
                    - Synchronized vehicles stored in a Firebase Realtime Database with a map using Geohashes.
                    - Improved scalability by conceptualizing a generalized Sharing MSP framework.
                    - Advanced the internal design system by collaborating with the design team to strategize it's adaptation by developers and building a range of key UI components.
                    - Drove the gradual introduction of async/await and SwiftUI into the codebase by giving presentations and providing compatibility and testing helpers.
                    - Regular participation in the recruitment process by conducting technical interviews and reviewing/creating iOS coding challenges.
                    """,
                    techBadges: [
                        "Swift", "UIKit", "SwiftUI", "MapKit", "CoreLocation", "SwiftPM", "async/await", "Firebase", "Github Actions", "SwiftGen"
                    ])

                // MARK: - Coral Gardeners

                Spacer(size: .extraLarge)

                WorkCard(
                    title: "Coral Gardeners",
                    image: "/images/work/CG-Mockups.png",
                    imageLayout: .left,
                    description: """
                        Coral Gardeners is a Tahiti-based NGO focused on restoring coral reefs. I developed their internal iOS ReefAPP from scratch using vanilla SwiftUI. The app is used by the coral restoration team to manage coral sites and collect health information during underwater growth monitoring. Yes, the app is used underwater with a waterproof iPhone case. The data is collected in a Firestore database due to its excellent offline data persistence and synchronization capabilities.
                        """,
                    keyFeaturesMarkdown: """
                         * Custom design system for consistent user interface and feature development speed
                         * Interactive Map showing different types of coral sites
                         * Coral health monitoring flow for use under water
                         * Capturing of images under water including their automatic upload when network becomes available
                         * Type-safe icon and translation generation using SwiftGen
                         """,
                    techBadges: [
                        "Swift", "SwiftUI", "Combine", "async/await", "MapKit", "Network", "CloudFirestore", "GoogleSignIn", "SwiftGen"
                    ])
            }
        }
    }
}
