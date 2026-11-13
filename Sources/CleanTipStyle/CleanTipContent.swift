//
//  CleanTipContent.swift
//  CleanTipStyle
//

import SwiftUI
import TipKit

struct CleanTipContent<Background: View>: View {
    let configuration: TipViewStyleConfiguration
    let cornerRadius: CGFloat
    let background: Background

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            configuration.image?
                .foregroundStyle(.tint)

            VStack(alignment: .leading, spacing: 4) {
                configuration.title?
                    .font(.headline)
                configuration.message?
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                ForEach(configuration.actions) { action in
                    Button(action: action.handler) { action.label() }
                        .buttonStyle(.plain)
                        .foregroundStyle(.tint)
                }
            }

            Spacer(minLength: 0)

            // Labelled for VoiceOver and Voice Control ("Tap Close tip"); shown as the icon only.
            Button("Close tip", systemImage: "xmark") {
                configuration.tip.invalidate(reason: .tipClosed)
            }
            .labelStyle(.iconOnly)
            .font(.caption.weight(.semibold))
            .foregroundStyle(.primary)
            #if os(iOS)
            .buttonStyle(CleanTipCloseButtonStyle())
            // Cancel the hit-area padding so the icon keeps its original position and size.
            .padding(-22)
            #else
            .buttonStyle(.plain)
            #endif
        }
        .padding()
        .background { background }
        .clipShape(.rect(cornerRadius: cornerRadius))
    }
}
