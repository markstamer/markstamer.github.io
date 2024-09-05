import Ignite

extension Image {
    func enlargeableViaModalPresentation(name: String) -> BlockElement {
        Group {
            self.onHover { isHovering in
                if isHovering {
                    ShowBoxShadow()
                } else {
                    HideBoxShadow()
                }
            }
            .style("cursor: pointer")
            .onClick {
                ShowModal(id: name)
            }

            Modal(id: name) {
                Group {
                    Image(systemName: "x-lg")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                .class("position-absolute top-0 end-0")
                .margin(.large)
                .onClick {
                    DismissModal(id: name)
                }

                Image(decorative: name)
                    .resizable()
                    .cornerRadius(6)
            }
            .size(.xLarge)
        }
    }
}
