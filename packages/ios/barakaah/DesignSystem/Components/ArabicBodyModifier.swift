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

// MARK: - Enhanced Arabic Modifier with Runtime Font Switching

struct ArabicTextModifier: ViewModifier {
    @Environment(\.barakaahTheme) private var theme

    var size: CGFloat = 22
    var lineHeight: CGFloat = 1.95
    var color: Color? = nil

    func body(content: Content) -> some View {
        content
            .font(Typography.arabicFont(theme.arabic, size: size, weight: .regular))
            .lineSpacing((lineHeight - 1) * size)
            .environment(\.layoutDirection, .rightToLeft)
            .foregroundStyle(color ?? theme.palette.txt)
    }
}

extension View {
    func arabicBody(size: CGFloat = 22, lineHeight: CGFloat = 1.95, color: Color? = nil) -> some View {
        modifier(ArabicTextModifier(size: size, lineHeight: lineHeight, color: color))
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
