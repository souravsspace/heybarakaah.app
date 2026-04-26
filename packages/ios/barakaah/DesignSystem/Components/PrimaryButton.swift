import SwiftUI

struct PrimaryButton<Label: View>: View {
    @Environment(\.barakaahTheme) private var theme
    
    let action: () -> Void
    var accent: Bool = false
    @ViewBuilder let label: () -> Label
    
    var body: some View {
        Button(action: action) {
            label()
                .font(theme.scaledSans(size: 16, weight: .semibold))
                .tracking(-0.16)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .padding(.horizontal, 18)
        }
        .buttonStyle(
            BarakaahPrimaryButtonStyle(
                palette: theme.palette,
                accent: accent
            )
        )
    }
}

struct BarakaahPrimaryButtonStyle: ButtonStyle {
    let palette: ColorPalette
    var accent: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(accent ? .white : palette.bone)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(accent ? palette.accent : palette.txt)
            )
            .scaleEffect(configuration.isPressed ? 0.985 : 1.0)
            .opacity(configuration.isPressed ? 0.92 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}

extension View {
    func primaryButtonDisabled() -> some View {
        self.opacity(0.4)
    }
}
