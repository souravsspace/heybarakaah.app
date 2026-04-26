import SwiftUI

struct ArabicBodyModifier: ViewModifier {
    var size: CGFloat = 22

    func body(content: Content) -> some View {
        content
            .font(.custom("Amiri-Regular", size: size))
            .lineSpacing(size * 1.95 - size)
            .environment(\.layoutDirection, .rightToLeft)
    }
}

extension View {
    func arabicBody(size: CGFloat = 22) -> some View {
        modifier(ArabicBodyModifier(size: size))
    }
}

// MARK: - ArabicText View

struct ArabicText: View {
    @Environment(\.barakaahTheme) private var theme
    
    let text: String
    var size: CGFloat = 22
    
    var body: some View {
        Text(text)
            .font(theme.scaledArabicBody(size: size))
            .foregroundStyle(theme.palette.txt)
            .environment(\.layoutDirection, .rightToLeft)
    }
}
