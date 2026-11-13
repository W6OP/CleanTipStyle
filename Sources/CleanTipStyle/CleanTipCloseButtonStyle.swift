import SwiftUI

#if os(iOS)
/// Expands the interactive label without changing the compact tip layout.
struct CleanTipCloseButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // At least 44 points, even at the smallest Dynamic Type size.
            .padding(22)
            .contentShape(.rect)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
#endif
