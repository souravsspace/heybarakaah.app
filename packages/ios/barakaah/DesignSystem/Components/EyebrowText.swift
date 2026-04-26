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
