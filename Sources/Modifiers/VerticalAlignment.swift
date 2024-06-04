import Foundation
import Ignite

/// Controls how elements are vertically positioned inside their container.
public enum VerticalAlignment: String {
    /// Aligns flex items at the start (top) of the container.
    case top = "align-items-start"

    /// Aligns flex items at the center (middle) of the container.
    case center = "align-items-center"

    /// Aligns flex items at the end (bottom) of the container.
    case bottom = "align-items-end"

    /// Aligns flex items along the container's baseline.
    case baseline = "align-items-baseline"

    /// Stretches flex items to fill the container's height (default behavior).
    case stretch = "align-items-stretch"

    var htmlName: String {
        rawValue
    }
}

extension BlockElement {
    /// Aligns the elements inside the container using the specific alignment.
    /// - Parameter alignment: How to align this element.
    /// - Returns: A copy of the current element with the updated
    /// vertical alignment applied.
    public func verticalContainerAlignment(_ alignment: VerticalAlignment) -> Self {
        self.class("\(alignment.htmlName)")
    }
}
