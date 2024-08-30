import Ignite

extension Card {
    static func projectCard(image: String, title: String, text: Text) -> Card {
        Card {
            Image(image)
                .resizable()
                .cornerRadius(6)

            Spacer(size: .medium)

            Text(title)
                .font(.title4)
            Text(text)
                .font(.body)
        }
        .style("border: none")
        .shadow(.black.opacity(0.1), radius: 8)
    }
}

