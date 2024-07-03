import Ignite

enum WorkCardImagePlacement {
    case left, right
}

struct WorkCard: Component {
    let title: String
    let image: String
    let imageLayout: WorkCardImagePlacement
    let description: String
    let keyFeaturesMarkdown: String
    let techBadges: [String]

    func body(context: PublishingContext) -> [any PageElement] {
        Card {
            Section {
                let textGroup = Group {
                    Text(title)
                        .font(.title3)

                    Text(description)
                }
                    .width(6)

                let image = Image(decorative: image)
                    .resizable()
                    .frame(minWidth: .containerWidth(.xxs))
                    .background(.black.opacity(0.02))
                    .cornerRadius(6)
                    .onHover { isHovering in
                        if isHovering {
                            ShowBoxShadow()
                        } else {
                            HideBoxShadow()
                        }
                    }
                    .onClick {
                        ShowModal(id: self.image)
                    }
                    .width(6)

                switch imageLayout {
                case .left:
                    image
                    textGroup
                case .right:
                    textGroup
                    image

                }
            }

            Modal(id: image) {
                Group {
                    Image(systemName: "x-lg")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                .class("position-absolute top-0 end-0")
                .margin(.large)
                .onClick {
                    DismissModal(id: image)
                }

                Image(decorative: image)
                    .resizable()
                    .background(.black.opacity(0.03))
                    .cornerRadius(6)
            }
            .size(.xLarge)

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
