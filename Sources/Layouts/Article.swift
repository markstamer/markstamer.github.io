import Foundation
import Ignite

struct Article: ContentPage {
    func body(content: Content, context: PublishingContext) -> [any BlockElement] {
        Group {
            Text(content.title)
                .font(.title2)

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
            .margin(.vertical, .medium)

            if let (externalSource, externalLink) = content.exteneralLink {
                Link(target: "\(externalLink)") {
                    Text("Read on \(externalSource)")
                        .fontWeight(.light)
                }
                .role(.dark)
                .linkStyle(.hover)
                .relationship(.external)
            }

            if let image = content.image {
                Image(image, description: content.imageDescription)
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(3.5, contentMode: .fill)
                    .margin(.vertical, .large)
            }

            Text(content.body)
        }
        .frame(maxWidth: .containerWidth(.medium))
    }
}

extension Content {
    public var exteneralLink: (source: String, link: String)? {
        guard let string = metadata["externalLink"] as? String else {
            return nil
        }
        let array = string.components(separatedBy: " ")
        guard
            array.count == 2,
            let source = array.first,
            let link = array.last
        else {
            return nil
        }
        return (source, link)
    }
}
