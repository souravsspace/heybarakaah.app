import SwiftUI

struct ScriptItalicModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Fraunces-Italic-VariableFont", size: 13))
            .fontWeight(.regular)
    }
}

extension View {
    func scriptItalic() -> some View {
        modifier(ScriptItalicModifier())
    }
}
