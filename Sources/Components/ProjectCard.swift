import Ignite

extension Card {
    static func projectCard(image: String, title: String, text: Text, enableImageModal: Bool = true) -> Card {
        Card {
            Image(decorative: image)
                .resizable()
                .cornerRadius(6)
                .if(enableImageModal) { element in
                    element.enlargeableViaModalPresentation(name: image)
                }
            
            Spacer(size: .medium)

            Text(title)
                .font(.title4)
            Text(text)
                .font(.body)
        }
        .style("border: none")
        .shadow(.black.opacity(0.1), radius: 8)
        .margin(.bottom, .large)
    }
}

extension PageElement {
    func `if`(_ condition: Bool, transform: (Self) -> PageElement) -> any PageElement {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
