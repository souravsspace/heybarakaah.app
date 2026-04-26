import SwiftUI

struct GhostButton<Label: View>: View {
    @Environment(\.barakaahTheme) private var theme
    
    let action: () -> Void
    @ViewBuilder let label: () -> Label
    
    var body: some View {
        Button(action: action) {
            label()
                .font(theme.scaledSans(size: 14, weight: .regular))
                .foregroundStyle(theme.palette.txt2)
                .padding(.vertical, 14)
                .padding(.horizontal, 18)
        }
        .buttonStyle(
            BarakaahGhostButtonStyle(palette: theme.palette)
        )
    }
}

struct BarakaahGhostButtonStyle: ButtonStyle {
    let palette: ColorPalette
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(.clear)
            .overlay {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .strokeBorder(palette.lineStrong, lineWidth: 1)
            }
            .scaleEffect(configuration.isPressed ? 0.985 : 1.0)
            .opacity(configuration.isPressed ? 0.92 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}
