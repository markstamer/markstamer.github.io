import Foundation

/// The width of the container in pixel
enum ContainerWidth: Int {
    case small = 540
    case medium = 720
    case large = 960
    case xl = 1140
    case xxl = 1320
}

extension Int {
    static func containerWidth(_ width: ContainerWidth) -> Self {
        width.rawValue
    }
}
