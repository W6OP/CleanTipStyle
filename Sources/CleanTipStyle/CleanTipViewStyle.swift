//
//  CleanTipViewStyle.swift
//  CleanTipStyle
//

import SwiftUI
import TipKit

/// A compact, dismissible `TipViewStyle` that delegates its background to the
/// caller. Apps with a custom theme can pass any `View` as the background; apps
/// without one can use the parameter-free convenience initializer to fall back
/// to a `.regularMaterial` fill.
public struct CleanTipViewStyle<Background: View>: TipViewStyle {
    public var cornerRadius: CGFloat
    public var background: Background

    public init(cornerRadius: CGFloat = 16, @ViewBuilder background: () -> Background) {
        self.cornerRadius = cornerRadius
        self.background = background()
    }

    public func makeBody(configuration: Configuration) -> some View {
        CleanTipContent(
            configuration: configuration,
            cornerRadius: cornerRadius,
            background: background
        )
    }
}

/// Convenience initializer for apps that don't supply their own background.
public extension CleanTipViewStyle where Background == DefaultCleanTipBackground {
    init(cornerRadius: CGFloat = 16) {
        self.init(cornerRadius: cornerRadius) { DefaultCleanTipBackground() }
    }
}
