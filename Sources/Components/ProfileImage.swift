import Foundation
import Ignite

extension Image {
    static var profile: some BlockElement {
        Image(decorative: "images/profile.jpeg")
            .resizable()
            .cornerRadius(8)
            .aspectRation(.square, contentMode: .fill)
    }
}
