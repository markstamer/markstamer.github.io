import Ignite

extension Home {

    var profileSection: Section {
        Section {
            introText
                .frame(maxWidth: .containerWidth(.small), alignment: .leading)
                .width(9)

            Group {
                profileImage
                Spacer(size: .large)
                socials
            }
            .horizontalAlignment(.center)
            .frame(maxWidth: 160)
            .margin(.top, .large)
            .width(3)
        }
        .verticalContainerAlignment(.top)
    }

    fileprivate var introText: some BlockElement {
        Group {
            Text("Hi, I'm Mark!")
                .font(.title2)
                .fontWeight(.regular)
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

    fileprivate var profileImage: some BlockElement {
        Group {
            Image(decorative: "/images/Profile-close.jpeg")
                .resizable()
                .class("object-fit-cover") // Make image aspect fill
                .cornerRadius(8) // Make a circular image by using "50%"
        }
        .aspectRatio(.square)
    }

    fileprivate var socials: some BlockElement {
        Text {
            Link(Image(systemName: "linkedin"), target: "https://www.linkedin.com/in/mark-stamer/")
                .role(.secondary)
                .padding(.small)
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
