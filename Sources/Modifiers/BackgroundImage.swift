import Foundation
import Ignite

extension PageElement {
    func backgroundImage(_ name: String, size: BackgroundSize, position: BackgroundPosition = .center, repeats: Bool = false) -> Self {
        style(
            "background-image: url('\(name)')",
            "background-size: \(size.htmlName)",
            "background-position: \(position.htmlName)",
            "background-repeat: \(repeats ? "repeat" : "no-repeat")"
        )
    }
}

public enum BackgroundSize {
    /// This is the default value. The background image is displayed at its original size.
    case original

    /// Scales the background image to cover the entire container while maintaining its aspect ratio.
    case fill

    /// Scales the background image to fit within the container without
    case fit

    /// The exact width and height using length values (pixels, ems, percentages, auto etc.)
    case size(width: String, height: String)
    
    /// The html name to use in css
    var htmlName: String {
        switch self {
        case .original:
            "auto"
        case .fill:
            "cover"
        case .fit:
            "contain"
        case .size(let width, let height):
            "\(width) \(height)"
        }
    }
}

public struct BackgroundPosition {

    /// The possible offset values going from left to right and top to bottom.
    /// For example an offset from the top edge of 10 px means 10 px down from the top.
    /// Likewise an offset from the top edge of 10 % means down 10 % of the total height.
    public enum Offset {
        case pixel(_ value: Int)
        case percent(_ value: Int)

        var htmlName: String {
            switch self {
            case .pixel(let value):
                "\(value)px"
            case .percent(let value):
                "\(value)%"
            }
        }
    }

    /// The positions used to define the background image by Bootstrap
    private enum Position: String {
        case center, top, bottom, left, right

        var htmlName: String {
            rawValue
        }
    }

    /// Positions the element at the center
    public static var center: Self { .init(.center) }

    /// Positions the element at the top
    public static var top: Self { .init(.top) }

    /// Positions the element at the bottom
    public static var bottom: Self { .init(.bottom)}

    /// Positions the element on the left
    public static var left: Self { .init(.left)}

    /// Positions the element on the right
    public static var right: Self { .init(.right) }

    /// Positions the element at the top with an offset
    public static func top(offset: Offset) -> Self { .init(.top, offset) }

    /// Positions the element at the bottom with an offset
    public static func bottom(offset: Offset) -> Self { .init(.bottom, offset) }

    /// Positions the element on the left with an offset
    public static func left(offset: Offset) -> Self { .init(.left, offset)}

    /// Positions the element on the right with an offset
    public static func right(offset: Offset) -> Self { .init(.right, offset) }

    /// Positions the element at the top left
    public static var topLeft: Self { .init(.top, nil, .left) }

    /// Positions the element at the top right
    public static var topRight: Self { .init(.bottom, nil, .right)}

    /// Positions the element on the bottom left
    public static var bottomLeft: Self { .init(.bottom, nil, .left)}

    /// Positions the element on the bottom right
    public static var bottomRight: Self { .init(.bottom, nil, .right) }

    /// Positions the element at the top left with a corresponding optional offset
    public static func topLeft(_ firstOffset: Offset?, _ secondOffset: Offset?) -> Self { .init(.top, firstOffset, .left, secondOffset) }
    
    /// Positions the element at the top right with a corresponding optional offset
    public static func topRight(_ firstOffset: Offset?, _ secondOffset: Offset?) -> Self { .init(.top, firstOffset, .right, secondOffset)}
    
    /// Positions the element on the bottom left with a corresponding optional offset
    public static func bottomLeft(_ firstOffset: Offset?, _ secondOffset: Offset?) -> Self { .init(.bottom, firstOffset, .left, secondOffset)}
    
    /// Positions the element on the bottom right with a corresponding optional offset
    public static func bottomRight(_ firstOffset: Offset?, _ secondOffset: Offset?) -> Self { .init(.bottom, firstOffset, .right, secondOffset)}

    private let first: Position
    private let firstOffset: Offset?
    private let second: Position?
    private let secondOffset: Offset?

    var htmlName: String {
        [first.htmlName, firstOffset?.htmlName, second?.htmlName, secondOffset?.htmlName]
            .compactMap { $0 }
            .joined(separator: " ")
    }

    private init(_ first: Position, _ firstOffset: Offset? = nil, _ second: Position? = nil, _ secondOffset: Offset? = nil) {
        self.first = first
        self.firstOffset = firstOffset
        self.second = second
        self.secondOffset = secondOffset
    }
}

