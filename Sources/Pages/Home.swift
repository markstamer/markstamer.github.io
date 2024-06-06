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
                .width(8)
                .margin(.bottom, .extraLarge)

            Group {
                profileImage
                Spacer(size: .large)
                socials
            }
            .horizontalAlignment(.center)
            .frame(maxWidth: 250)
            .width(4)
        }
        .verticalContainerAlignment(.top)
    }

    var introText: some BlockElement {
        Group {
            Text {
                Image(decorative: "/images/Swift_logo_color.svg")
                    .resizable()
                    .frame(height: "1.1em")
                    .verticalAlignment(.textBottom)
                " Hi, I'm Mark Stamer"
            }
            .font(.title1)
            .fontWeight(.regular)
            .margin(.bottom, .large)

            Text("iOS Developer | SwiftUI Enthusiast | PhD in Medical Engineering")
                .foregroundStyle(.secondary)
                .font(.title4)
                .fontWeight(.light)
                .margin(.bottom, .large)

            Text {
                "I'm a native iOS developer from Germany who thrives on the idea of using the iPhone as a canvas for my coding skills. I enjoy diving into new technologies at an early stage to gain a deep understanding of their workings and potential. Before discovering my passion for software development, I pursued a career in Medical Engineering."
            }
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
                .padding(.vertical, .small)
                .padding(.trailing, .small)
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
            Card {
                Text("Field Experience")
                    .font(.title5)

                var badges = ["Urban Mobility", "Medical Engineering", "Coral Restoration"]

                Text {
                    for badge in badges {
                        Badge(badge)
                            .badgeStyle(.subtleBordered).role(.primary)
                            .margin([.top, .trailing], .small)
                    }
                }
                .font(.body)
            }
            .style("border: none")
            .width(4)


            Card {
                Text("Knowledge")
                    .font(.title5)

                var badges = ["Swift", "SwiftUI", "UIKit", "async/await", "Combine", "MapKit", "SwiftPM", "SwiftGen"]

                Text {
                    for badge in badges {
                        Badge(badge)
                            .badgeStyle(.subtleBordered).role(.secondary)
                            .margin([.top, .trailing], .small)
                    }
                }
                .font(.body)
            }
            .style("border: none")
            .width(4)

            Card {
                Text("Following")
                    .font(.title5)

                var badges = ["Paul Hudson", "Janum Trivedi", "Majid Jabrayilov", "Javier (swiftui-lab)", "Sarun W.", "John Sundell", "Soroush Khanlou"].shuffled()

                Text {
                    for badge in badges {
                        Badge(badge)
                            .badgeStyle(.subtleBordered).role(.warning)
                            .margin([.top, .trailing], .small)
                    }
                }
                .font(.body)
            }
            .style("border: none")
            .width(4)
        }
    }
}

extension Group {
    static func empty(width: Int) -> Group {
        Group { }.width(width)
    }
}

extension Group {
    static func card(title: String, description: String, image: String) -> Group {
        Group {
            
        }
    }
}
