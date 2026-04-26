import SwiftUI

struct LargeTitle: View {
    @Environment(\.barakaahTheme) private var theme
    
    let text: Text
    
    init(_ text: Text) {
        self.text = text
    }
    
    init(_ string: String) {
        self.text = Text(string)
    }
    
    var body: some View {
        text
            .font(theme.scaledLgTitle())
            .tracking(-0.76 * theme.fontScale)
            .lineSpacing(38 * theme.fontScale * 0.05)
            .foregroundStyle(theme.palette.txt)
    }
}
