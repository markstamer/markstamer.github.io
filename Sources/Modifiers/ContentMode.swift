import Foundation
import Ignite

enum ContentMode {
    case fit, fill

    var htmlClass: String {
        "object-fit-\(self == .fill ? "cover" : "contain")"
    }
}

extension BlockElement where Self == Image {
    func aspectRation(_ ratio: AspectRatio, contentMode: ContentMode) -> some BlockElement {
        Group {
            self.class(contentMode.htmlClass)
        }
        .aspectRatio(ratio)
    }
}

protocol MediaContent: BlockElement { }
extension Image: MediaContent { }
extension Video: MediaContent { }

extension MediaContent {
    func aspectRation(_ ratio: AspectRatio, contentMode: ContentMode) -> some BlockElement {
        Group {
            self.class(contentMode.htmlClass)
        }
        .aspectRatio(ratio)
    }

    func aspectRation(_ ratio: Double, contentMode: ContentMode) -> some BlockElement {
        Group {
            self.class(contentMode.htmlClass)
        }
        .aspectRatio(ratio)
    }
}
