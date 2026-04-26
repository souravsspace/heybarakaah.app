import SwiftUI

struct HomeIndicatorView: View {
    @Environment(\.barakaahTheme) private var theme

    var body: some View {
        if BarakaahPreviewShell.enabled {
            VStack(spacing: 0) {
                Capsule()
                    .fill(
                        theme.theme == .light
                            ? Color.black.opacity(0.30)
                            : theme.palette.cream.opacity(0.4)
                    )
                    .frame(width: 124, height: 4)
            }
            .frame(height: 22)
            .padding(.bottom, 7)
        }
    }
}

#Preview("Light") {
    HomeIndicatorView()
        .environment(\.barakaahTheme, BarakaahTheme(theme: .light, accent: .terracotta, sans: .sf, arabic: .amiri, fontScale: 0.95, radius: 22, blur: 28))
}

#Preview("Dark") {
    HomeIndicatorView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .background(Color(hex: 0x1A1612))
}
