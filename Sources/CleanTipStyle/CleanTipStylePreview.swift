//
//  CleanTipStylePreview.swift
//  CleanTipStyle
//
//  Lightweight Xcode previews that demonstrate `CleanTipViewStyle`.
//  Gated to DEBUG so previews don't ship in release builds of consumers.
//

#if DEBUG
import SwiftUI
import TipKit

private struct CleanTipStyleSampleTip: Tip {
    var title: Text {
        Text("Drafts and scheduled posts")
    }

    var message: Text? {
        Text("Save a post as a draft, return to a saved draft, or schedule one for later.")
    }

    var image: Image? {
        Image(systemName: "doc.badge.clock")
    }
}

private struct CleanTipStylePreviewHost<Style: TipViewStyle>: View {
    let style: Style

    var body: some View {
        TipView(CleanTipStyleSampleTip())
            .tipViewStyle(style)
            .padding()
            .frame(width: 360)
            .task {
                try? Tips.resetDatastore()
                try? Tips.configure([.displayFrequency(.immediate)])
            }
    }
}

#Preview("Default background") {
    CleanTipStylePreviewHost(style: CleanTipViewStyle())
}

#Preview("Custom gradient background") {
    CleanTipStylePreviewHost(
        style: CleanTipViewStyle {
            LinearGradient(
                colors: [.purple.opacity(0.25), .blue.opacity(0.25)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    )
}
#endif
