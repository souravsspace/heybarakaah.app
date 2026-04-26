import SwiftUI

struct GlassButton<Label: View>: View {
    @Environment(\.barakaahTheme) private var theme
    
    let action: () -> Void
    @ViewBuilder let label: () -> Label
    
    var body: some View {
        Button(action: action) {
            label()
                .font(theme.scaledSans(size: 15, weight: .medium))
                .foregroundStyle(theme.palette.txt)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .padding(.horizontal, 18)
        }
        .buttonStyle(
            BarakaahGlassButtonStyle(palette: theme.palette)
        )
    }
}

struct BarakaahGlassButtonStyle: ButtonStyle {
    let palette: ColorPalette
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .background(
                palette.glassBg
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            )
            .overlay {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .strokeBorder(palette.glassBorder, lineWidth: 0.5)
            }
            .scaleEffect(configuration.isPressed ? 0.985 : 1.0)
            .opacity(configuration.isPressed ? 0.92 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}
