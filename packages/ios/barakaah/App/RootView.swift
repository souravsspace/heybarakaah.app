import SwiftUI

struct RootView: View {
    @State private var theme = BarakaahTheme.default
    
    var body: some View {
        VStack {
            Text("Barakaah")
                .font(theme.scaledSerif(size: 38, weight: .light))
                .foregroundStyle(theme.palette.txt)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.bgGradient(for: theme.theme)
                .ignoresSafeArea()
        }
        .environment(\.barakaahTheme, theme)
    }
}

#Preview {
    RootView()
}
