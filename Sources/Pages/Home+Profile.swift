import Ignite

extension Home {

    var profileSection: some BlockElement {
        Group {
            introText
                .frame(maxWidth: .containerWidth(.medium), alignment: .leading)

            Spacer(size: .extraLarge)

            tagSection
        }
    }

    fileprivate var introText: some BlockElement {
        Group {
            Text("Hi, I'm Mark. 👋")
                .font(.title1)
                .foregroundStyle(.secondary)
                .margin(.bottom, .large)

            Text("iOS Developer | SwiftUI Enthusiast | Medical Engineering PhD")
                .foregroundStyle(.secondary)
                .font(.title5)
                .fontWeight(.regular)
                .margin(.bottom, .large)

            Text("I'm a native iOS developer from Hamburg, Germany, who enjoys writing Swift code and delighful user interfaces with SwiftUI. Before discovering my passion for software development, I pursued a career in Medical Engineering.")
                .foregroundStyle(.secondary)
                .font(.lead)
                .fontWeight(.light)
        }
    }

    fileprivate var tagSection: Section {
        Section {
            Card.badgeCard(
                title: "Field Experience",
                badges: ["Urban Mobility", "Coral Restoration", "Medical Engineering"],
                role: .primary
            )
            .width(3)


            Card.badgeCard(
                title: "Knowledge",
                badges: ["Swift", "SwiftUI", "UIKit", "async/await", "Combine", "MapKit", "CoreLocation", "SwiftPM", "..."],
                role: .success
            )
            .width(4)

            Card.badgeCard(
                title: "Favorite Creators",
                badges: ["Majid Jabrayilov", "Paul Hudson", "Sarun W.", "Chris Eidhof", "Javier (swiftui-lab)", "John Sundell", "Soroush Khanlou", "Janum Trivedi"],
                role: .warning
            )
            .width(5)
        }
    }
}
