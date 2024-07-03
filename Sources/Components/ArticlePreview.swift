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
                    .verticalAlignment(.center)
                    .margin(.bottom, 4)
            }

            Image(systemName: "dot")
                .padding(.horizontal, .small)

            content.date.formatted(date: .abbreviated, time: .omitted)

            Image(systemName: "dot")
                .padding(.horizontal, .small)

            "\(content.estimatedReadingMinutes) min read"
        }
        .font(.title5)
        .fontWeight(.light)

        Text(content.description)
    }
}

