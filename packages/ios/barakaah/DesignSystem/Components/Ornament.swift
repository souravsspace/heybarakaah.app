import SwiftUI

struct Ornament: View {
    @Environment(\.barakaahTheme) private var theme
    
    var body: some View {
        Capsule()
            .fill(theme.palette.accent.opacity(0.5))
            .frame(width: 24, height: 1)
    }
}

#Preview {
    Ornament()
}
