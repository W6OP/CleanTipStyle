# CleanTipStyle

A compact, dismissible `TipViewStyle` for SwiftUI's TipKit, with a pluggable background so it can match any app's visual style.

The tip lays out a leading icon, title/message stack, optional action buttons, and a close button — and lets the caller decide what shape and material sit behind it.

## Requirements

- Swift 6.2 or later
- iOS 26+ / macOS 26+
- TipKit

## Installation

### Swift Package Manager (Xcode)

In Xcode: **File → Add Package Dependencies…**, then enter:
https://github.com/<your-username>/CleanTipStyle

Add the `CleanTipStyle` library product to your app target.

### Swift Package Manager (Package.swift)

```swift
dependencies: [
    .package(url: "https://github.com/<your-username>/CleanTipStyle", from: "1.0.0")
]

Then add "CleanTipStyle" to your target's dependencies.

Usage

With your own background

Pass any View as the background. It's applied behind the tip content and clipped to the rounded shape.

import SwiftUI
import TipKit
import CleanTipStyle

struct ContentView: View {
    var body: some View {
        SomeView()
            .popoverTip(MyTip(), arrowEdge: .top)
            .tipViewStyle(
                CleanTipViewStyle {
                    LinearGradient(
                        colors: [.purple.opacity(0.25), .blue.opacity(0.25)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
            )
    }
}

With the default background

If you don't need a custom look, the parameter-free initializer falls back to a .regularMaterial
fill that reads cleanly in light and dark mode.

.tipViewStyle(CleanTipViewStyle())

Customizing the corner radius

Both initializers accept an optional cornerRadius (default 16):.tipViewStyle(CleanTipViewStyle(cornerRadius: 12))

.tipViewStyle(CleanTipViewStyle(cornerRadius: 20) {
    Color.accentColor.opacity(0.15)
})

Bridging to an app-wide theme

If your app already has an environment-driven background style, wrap it in a small bridge view so the tip stays in sync:

struct MyAppTipBackground: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(AppTheme.self) private var theme

    var body: some View {
        LinearGradient.appBackground(for: theme.style, colorScheme: colorScheme)
    }
}

// At the call site:
.tipViewStyle(CleanTipViewStyle { MyAppTipBackground() })

API

public struct CleanTipViewStyle<Background: View>: TipViewStyle {
    public init(cornerRadius: CGFloat = 16, @ViewBuilder background: () -> Background)
}

public extension CleanTipViewStyle where Background == DefaultCleanTipBackground {
    init(cornerRadius: CGFloat = 16)
}

public struct DefaultCleanTipBackground: View { /* .regularMaterial fill */ }

License

MIT — see LICENSE
