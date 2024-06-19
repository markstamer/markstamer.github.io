import Foundation
import Ignite

/// Controls how an element is vertically positioned inside their container.
public enum InlineVerticalAlignment {
    /// The default alignment
    case baseline

    /// Aligns the top of the element with the top of the tallest element on the line.
    case top

    /// Aligns the middle of the element with the middle of the parent element's line height.
    case center

    /// Aligns the bottom of the element with the lowest element on the line.
    case bottom

    /// Positions the element as a subscript
    case `subscript`

    /// Positions the element as a superscript.
    case superscript

    /// Aligns the top of the element with the top of the parent’s font.
    case textTop

    /// Aligns the bottom of the element with the bottom of the parent’s font.
    case textBottom

    /// Moves the element by a specified length in pixel or percent e.g. 10px, 10%.
    case offset(String)

    /// The HTML name for the alignment.
    var htmlName: String {
        switch self {
        case .baseline:
            "baseline"
        case .top:
            "top"
        case .center:
            "middle"
        case .bottom:
            "bottom"
        case .subscript:
            "sub"
        case .superscript:
            "super"
        case .textTop:
            "text-top"
        case .textBottom:
            "text-bottom"
        case .offset(let value):
            value
        }
    }
}

extension InlineElement {
    /// Aligns this element using the specific alignment.
    /// - Parameter alignment: How to align this element.
    /// - Returns: A copy of the current element with the updated
    /// vertical alignment applied.
    public func verticalAlignment(_ alignment: InlineVerticalAlignment) -> Self {
        style("vertical-align: \(alignment.htmlName)")
    }
}
