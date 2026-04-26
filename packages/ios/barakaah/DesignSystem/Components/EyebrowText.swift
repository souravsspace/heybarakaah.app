import SwiftUI

struct EyebrowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("PlusJakartaSans-VariableFont", size: 10.5))
            .fontWeight(.semibold)
            .tracking(10.5 * 0.18)
            .textCase(.uppercase)
    }
}

extension View {
    func eyebrow() -> some View {
        modifier(EyebrowModifier())
    }
}

// MARK: - EyebrowText View

struct EyebrowText: View {
    @Environment(\.barakaahTheme) private var theme
    
    let text: String
    var accent: Bool = false
    
    var body: some View {
        Text(text.uppercased())
            .font(theme.scaledSans(size: 10.5, weight: .semibold))
            .tracking(10.5 * theme.fontScale * 0.18)
            .foregroundStyle(accent ? theme.palette.accent : theme.palette.txt3)
    }
}

// MARK: - Eyebrow Accent Modifier

struct EyebrowAccentModifier: ViewModifier {
    @Environment(\.barakaahTheme) private var theme
    
    func body(content: Content) -> some View {
        content
            .font(theme.scaledSans(size: 10.5, weight: .semibold))
            .tracking(10.5 * theme.fontScale * 0.18)
            .textCase(.uppercase)
            .foregroundStyle(theme.palette.accent)
    }
}

extension View {
    func eyebrowAccent() -> some View {
        modifier(EyebrowAccentModifier())
    }
}
