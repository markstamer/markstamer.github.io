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
            Image(decorative: "images/profile.jpeg")
                .resizable()
                .cornerRadius(8)
                .aspectRation(.square, contentMode: .fill)
    }

    fileprivate var socials: some BlockElement {
        Text {
            let socials: [(image: String, target: String)] = [
                ("linkedin", "https://www.linkedin.com/in/mark-stamer/"),
                ("github", "https://github.com/markstamer/"),
                ("twitter", "https://x.com/mIaIrIk")
            ]

            for social in socials {
                Link(Image(systemName: social.image), target: social.target)
                    .role(.secondary)
                    .padding(.small)
                    .relationship(.noOpener, .noReferrer)
            }
        }
        .font(.title3)
    }
}

enum ContentMode {
    case fit, fill

    var htmlClass: String {
        "object-fit-\(self == .fill ? "cover" : "contain")"
    }
}

extension BlockElement where Self == Image {
    func aspectRation(_ ratio: AspectRatio, contentMode: ContentMode) -> some BlockElement {
        Group {
            self.class(contentMode.htmlClass)
        }
        .aspectRatio(ratio)
    }
}

protocol MediaContent: BlockElement { }
extension Image: MediaContent { }
extension Video: MediaContent { }

extension MediaContent {
    func aspectRation(_ ratio: AspectRatio, contentMode: ContentMode) -> some BlockElement {
        Group {
            self.class(contentMode.htmlClass)
        }
        .aspectRatio(ratio)
    }

    func aspectRation(_ ratio: Double, contentMode: ContentMode) -> some BlockElement {
        Group {
            self.class(contentMode.htmlClass)
        }
        .aspectRatio(ratio)
    }
}
