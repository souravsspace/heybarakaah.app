import SwiftUI

struct GlassStrongBackground: ViewModifier {
    func body(content: Content) -> some View {
        content.glass(strong: true)
    }
}

extension View {
    func glassStrong() -> some View {
        modifier(GlassStrongBackground())
    }
}
