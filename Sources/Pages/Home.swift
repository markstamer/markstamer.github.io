import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    func body(context: PublishingContext) -> [BlockElement] {
        Spacer(size: .extraLarge)

        profileSection
            .frame(maxWidth: .containerWidth(.large))

        Spacer(size: .extraLarge)

        Section {
            Card {
                Text("I followw")
                    .font(.title5)

                Text("Paul Hudson, Janum Trivedi, Majid Jabrayilov")
            }
            .cardStyle(.default)
            .role(.light)
            .width(4)

            Card {
                Text("I know")
                    .font(.title5)

                Text("Swift, SwiftUI, async/await, Combine")
            }
//            .cardStyle(.default)
//            .role(.light)
            .width(4)

//            Card {
//                Text("I know")
//                    .font(.title5)
//
//                Text("Swift, SwiftUI, async/await, Combine")
//            }
//            .cardStyle(.default)
//            .role(.light)
//            .width(4)
        }
        .frame(maxWidth: .containerWidth(.large))
    }

    var profileSection: Section {
        Section {
            introText
                .frame(maxWidth: .containerWidth(.medium))
                .width(8)

            Group {
                profileImage
                Spacer(size: .large)
                socials
            }
            .width(4)
            .horizontalAlignment(.center)
        }
        .verticalContainerAlignment(.center)
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

            Text("iOS Developer | SwiftUI Enthusiast | PhD, Medical Engineering")
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
            Image("/images/Profile.jpeg")
                .resizable()
                .class("object-fit-cover") // Make image aspect fill
                .cornerRadius(8) // Make a circular image by using "50%"
        }
        .aspectRatio(.square)
        .frame(maxWidth: 250)
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
