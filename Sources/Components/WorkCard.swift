import Ignite

enum WorkCardImagePlacement {
    case left, right
}

struct WorkCard: Component {
    let title: String
    let image: String
    let imageLayout: WorkCardImagePlacement
    let description: Text
    let keyFeaturesMarkdown: String
    let techBadges: [String]

    func body(context: PublishingContext) -> [any PageElement] {
        Card {
            Section {
                let textGroup = Group {
                    Text(title)
                        .font(.title3)

                    description
                }
                    .width(6)

                let image = Image(decorative: image)
                    .resizable()
                    .frame(minWidth: .containerWidth(.xxs))
                    .cornerRadius(6)
                    .width(6)
                    .enlargeableViaModalPresentation(name: image)

                switch imageLayout {
                case .left:
                    image
                    textGroup
                case .right:
                    textGroup
                    image

                }
            }

            Group {
                Group {
                    Text("Tech Stack")
                        .font(.title5)
                        .fontWeight(.regular)
                        .margin(.bottom, .small)

                    Text {
                        for badge in techBadges {
                            Badge(badge)
                                .badgeStyle(.subtleBordered).role(.success)
                                .margin([.top, .trailing], .small)
                        }
                    }
                    .font(.body)
                }
                .margin(.horizontal, .medium)

                Accordion {
                    Item(Text("Key Contributions")
                        .font(.title5)
                        .fontWeight(.regular)
                        .margin(.bottom, -2)
                    ) {
                        Text(markdown: keyFeaturesMarkdown)
                    }
                    .style("border: none")
                }
                .margin(.top, .large)
            }
            .margin(.top, .large)
        }
        .style("border: none")
        .shadow(.black.opacity(0.1), radius: 8)
    }
}
