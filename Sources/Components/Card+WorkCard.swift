import Ignite

extension Card {
    static func workCard(title: String, image: String, description: String, keyFeaturesMarkdown: String, techBadges: [String]) -> Card {
        Card {
            Section {
                Group {
                    Text(title)
                        .font(.title3)

                    Text(description)
                }
                .frame(minWidth: .containerWidth(.small), alignment: .leading)

                Image(decorative: image)
                    .resizable()
                    .frame(minWidth: .containerWidth(.xxs))
                    .background(.black.opacity(0.03))
                    .cornerRadius(6)
                    .onHover { isHovering in
                        if isHovering {
                            ShowBoxShadow()
                        } else {
                            HideBoxShadow()
                        }
                    }
                    .onClick {
                        ShowModal(id: "ModalImageLarge")
                    }

            }

            Modal(id: "ModalImageLarge") {
                Group {
                    Image(systemName: "x-lg")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .class("position-absolute top-0 end-0")
                .margin(.large)
                .onClick {
                    DismissModal(id: "ModalImageLarge")
                }

                Image(decorative: image)
                    .resizable()
                    .background(.black.opacity(0.03))
                    .cornerRadius(6)
            }
            .size(.large)

            Group {
                Text("Key Features")
                    .font(.lead)
                    .fontWeight(.medium)

                Text(markdown: keyFeaturesMarkdown)

            }.padding(.top, .medium)

            Group {
                Text("Tech stack").font(.lead).fontWeight(.medium)
                Text {
                    for badge in techBadges {
                        Badge(badge)
                            .badgeStyle(.subtleBordered).role(.success)
                            .margin([.top, .trailing], .small)
                    }
                }
                .font(.body)
            }
        }
        .style("border: none")
        .background(.white.opacity(0))
        .shadow(.black.opacity(0.1), radius: 8)
    }
}