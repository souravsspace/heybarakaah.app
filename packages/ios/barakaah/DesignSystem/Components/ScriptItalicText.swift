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

// MARK: - ScriptItalicText View

struct ScriptItalicText: View {
    @Environment(\.barakaahTheme) private var theme
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(theme.scaledSerif(size: 13, italic: true))
            .foregroundStyle(theme.palette.txt3)
    }
}
