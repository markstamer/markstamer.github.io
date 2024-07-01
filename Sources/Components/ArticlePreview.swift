import Ignite

struct ArticlePreview: Component {

    let content: Content

    func body(context: PublishingContext) -> [any PageElement] {
        Text {
            Link(content)
                .linkStyle(.hover)
                .role(.secondary)
        }
        .font(.title2)
        .padding(.bottom, .small)

        Text {
            for tag in content.tags {
                Badge(tag)
                    .role(.success)
                    .badgeStyle(.subtle)
                    .margin(.trailing, .medium)
                    .verticalAlignment(.center)
                    .margin(.bottom, 4)
            }

            content.date.formatted(date: .abbreviated, time: .omitted)
        }
        .font(.title5)
        .fontWeight(.light)

        Text(content.description)
    }
}

