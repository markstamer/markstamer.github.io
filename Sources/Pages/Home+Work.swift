import Ignite

extension Home {
    var workSection: Section {
        Section {
            Group {
                Text("Work.")
                    .font(.title1)
                    .foregroundStyle(.secondary)

                Spacer(size: .extraLarge)

                Card.workCard(
                    title: "Coral Gardeners",
                    image: "/images/CG Mockups.png",
                    description: "Coral Gardeners is a Tahiti-based NGO focused on restoring coral reefs. I developed their internal iOS ReefAPP from scratch using vanilla SwiftUI. The app is used by the coral restoration team to manage coral sites and collect health information during underwater growth monitoring. Yes, the app is used underwater with a waterproof iPhone case. The data is collected in a Firestore database due to its excellent offline data persistence and synchronization capabilities.",
                    keyFeaturesMarkdown: """
                         * `Custom design system` for consistent user interface and feature development speed
                         * `Interactive Map` showing different types of coral sites
                         * Coral health `monitoring flow` for use under water
                         * `Capturing of images` under water including their automatic upload when network becomes available
                         * `Type-safe icon and translation` generation using SwiftGen
                         """,
                    techBadges: [
                        "SwiftUI", "Combine", "MapKit", "CloudFirestore", "GoogleSignIn", "SwiftGen"
                    ])
            }
        }
    }
}
