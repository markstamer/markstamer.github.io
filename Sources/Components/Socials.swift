import Foundation
import Ignite

extension Text {
    static var socials: Text {
        Text {
            let socials: [(image: String, target: String)] = [
                ("linkedin", "https://www.linkedin.com/in/mark-stamer/"),
                ("github", "https://github.com/markstamer/"),
                ("twitter", "https://x.com/mIaIrIk")
            ]

            for social in socials {
                Link(Image(systemName: social.image), target: social.target)
                    .role(.secondary)
                    .padding(.small)
                    .relationship(.noOpener, .noReferrer)
            }
        }
        .font(.title3)
    }
}
