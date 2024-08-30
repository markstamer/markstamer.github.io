import Ignite

extension Link {
    /// Adjusts the font weight (boldness) of this font.
    /// - Parameter newWeight: The new font weight.
    /// - Returns: A new `Text` instance with the updated weight.
    public func fontWeight(_ newWeight: FontWeight) -> Self {
        self.style("font-weight: \(newWeight.rawValue)")
    }
}
