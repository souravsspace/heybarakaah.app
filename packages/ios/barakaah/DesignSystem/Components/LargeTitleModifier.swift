import SwiftUI

struct LargeTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Fraunces-VariableFont", size: 38))
            .fontWeight(.light)
            .tracking(-0.76)
            .lineSpacing(38 * 1.05 - 38)
    }
}

extension View {
    func lgTitle() -> some View {
        modifier(LargeTitleModifier())
    }
}
