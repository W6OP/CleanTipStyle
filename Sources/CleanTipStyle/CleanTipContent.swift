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

            Button {
                configuration.tip.invalidate(reason: .tipClosed)
            } label: {
                Image(systemName: "xmark")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
            }
            .buttonStyle(.plain)
            .focusable(false)
        }
        .padding()
        .background { background }
        .clipShape(.rect(cornerRadius: cornerRadius))
    }
}
