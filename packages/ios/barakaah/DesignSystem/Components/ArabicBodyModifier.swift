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
