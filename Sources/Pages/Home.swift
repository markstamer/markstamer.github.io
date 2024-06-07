import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    func body(context: PublishingContext) -> [BlockElement] {
        Spacer(size: .large)

        profileSection
            .frame(maxWidth: .containerWidth(.large))

        Spacer(size: .large)

        tagSection
            .frame(maxWidth: .containerWidth(.large))
    }

    var profileSection: Section {
        Section {
            introText
                .frame(maxWidth: .containerWidth(.medium))
                .width(9)

            Group {
                profileImage
                Spacer(size: .large)
                socials
            }
            .horizontalAlignment(.center)
            .frame(maxWidth: 140)
            .margin(.top, .large)
            .width(3)
        }
        .verticalContainerAlignment(.top)
    }

    var introText: some BlockElement {
        Group {
            Text("Hi, I'm Mark!")
                .font(.title2)
                .fontWeight(.light)
                .margin(.bottom, .large)

            Text("iOS Developer | SwiftUI Enthusiast | Medical Engineering PhD")
                .foregroundStyle(.secondary)
                .font(.title5)
                .fontWeight(.regular)
                .margin(.bottom, .large)

            Text("I'm a native iOS developer from Hamburg, Germany. I enjoy writing Swift code and delighful user interfaces with SwiftUI. I'm curious about new technologies and start tinkering with them early on to get a feel for their potential. Before discovering my passion for software development, I pursued a career in Medical Engineering.")
                .foregroundStyle(.secondary)
                .font(.lead)
                .fontWeight(.light)
        }
    }

    var profileImage: some BlockElement {
        Group {
            Image("/images/Profile-close.jpeg")
                .resizable()
                .class("object-fit-cover") // Make image aspect fill
                .cornerRadius(8) // Make a circular image by using "50%"
        }
        .aspectRatio(.square)
    }

    var socials: some BlockElement {
        Text {
            Link(Image(systemName: "linkedin"), target: "https://www.linkedin.com/in/mark-stamer/")
                .role(.secondary)
                .padding(.small)
//                .padding(.trailing, .small)
            Link(Image(systemName: "github"), target: "https://github.com/markstamer/")
                .role(.secondary)
                .padding(.small)
            Link(Image(systemName: "twitter"), target: "https://x.com/mIaIrIk")
                .role(.secondary)
                .padding(.small)
        }
        .font(.title3)
    }

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
                badges: ["Swift", "SwiftUI", "UIKit", "async / await", "Combine", "MapKit", "SwiftPM", "SwiftGen"],
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

extension Group {
    static func empty(width: Int) -> Group {
        Group { }.width(width)
    }
}

extension Card {
    static func badgeCard(title: String, badges: [String], role: Role) -> Card {
        Card {
            Text(title)
                .font(.title5)
            Text {
                for badge in badges {
                    Badge(badge)
                        .badgeStyle(.subtleBordered).role(role)
                        .margin([.top, .trailing], .small)
                }
            }
            .font(.body)
        }
        .style("border: none")
    }
}
