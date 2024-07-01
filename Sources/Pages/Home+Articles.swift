import Ignite

extension Home {
    func articleSection(_ items: [Content]) -> Section {
        Section {
            Group {
                Text("Articles.")
                    .font(.title1)
                    .foregroundStyle(.secondary)

                Spacer(size: .extraLarge)

                for item in items {
                    ArticlePreview(content: item)
                }
            }
        }
    }
}
