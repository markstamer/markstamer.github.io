import Foundation
import Ignite

struct Article: ContentPage {
    func body(content: Content, context: PublishingContext) -> [any BlockElement] {
        Section {
            Text(content.title)
                .font(.title1)

            if let image = content.image {
                Image(image, description: content.imageDescription)
                    .resizable()
                    .cornerRadius(20)
                    .frame(maxHeight: 300)
                    .horizontalAlignment(.center)
            }

            Group {
                if content.hasTags {
                    Text("Tagged with: \(content.tags.joined(separator: ", "))")
                }

                Text("\(content.estimatedWordCount) words; \(content.estimatedReadingMinutes) minutes to read.")
            }

            Text(content.body)
        }
        .frame(maxWidth: .containerWidth(.large))
    }
}
