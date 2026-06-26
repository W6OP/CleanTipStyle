//
//  DefaultCleanTipBackground.swift
//  CleanTipStyle
//

import SwiftUI

/// The fallback background used by `CleanTipViewStyle` when the caller doesn't
/// provide one. A simple `.regularMaterial` fill that reads cleanly in light
/// and dark mode.
public struct DefaultCleanTipBackground: View {
    public init() {}

    public var body: some View {
        Rectangle().fill(.regularMaterial)
    }
}
