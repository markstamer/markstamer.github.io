import Ignite

extension Home {
    var tagSection: Section {
        Section {
            Card.badgeCard(
                title: "Field Experience",
                badges: ["Urban Mobility", "Coral Restoration", "Medical Engineering"],
                role: .primary
            )
            .width(3)


            Card.badgeCard(
                title: "Knowledge",
                badges: ["Swift", "SwiftUI", "UIKit", "async / await", "Combine", "MapKit", "SwiftPM", "..."],
                role: .warning
            )
            .width(4)

            Card.badgeCard(
                title: "Favorite Creators",
                badges: ["Majid Jabrayilov", "Paul Hudson", "Chris Eidhof", "Javier (swiftui-lab)", "Sarun W.", "John Sundell", "Soroush Khanlou", "Janum Trivedi"],
                role: .secondary
            )
            .width(5)
        }
    }
}
