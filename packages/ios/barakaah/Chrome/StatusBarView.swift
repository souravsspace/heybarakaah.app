import SwiftUI

enum BarakaahPreviewShell {
    static let enabled = true
}

struct StatusBarView: View {
    @Environment(\.barakaahTheme) private var theme

    var time: String = "9:41"

    var body: some View {
        if BarakaahPreviewShell.enabled {
            HStack {
                Text(time)
                    .font(theme.scaledSans(size: 15, weight: .semibold))
                    .tracking(-0.15)
                    .foregroundStyle(theme.theme == .light ? theme.palette.espresso : theme.palette.cream)

                Spacer()

                HStack(spacing: 6) {
                    signalBars
                    batteryIcon
                }
                .foregroundStyle(theme.theme == .light ? theme.palette.espresso : theme.palette.cream)
            }
            .padding(.horizontal, 28)
            .padding(.top, 14)
            .padding(.bottom, 6)
            .frame(height: 44)
        }
    }

    private var signalBars: some View {
        HStack(alignment: .bottom, spacing: 1.5) {
            RoundedRectangle(cornerRadius: 1)
                .frame(width: 3, height: 4)
            RoundedRectangle(cornerRadius: 1)
                .frame(width: 3, height: 6)
            RoundedRectangle(cornerRadius: 1)
                .frame(width: 3, height: 8)
            RoundedRectangle(cornerRadius: 1)
                .frame(width: 3, height: 10)
        }
    }

    private var batteryIcon: some View {
        HStack(spacing: 1) {
            ZStack {
                RoundedRectangle(cornerRadius: 3)
                    .stroke(lineWidth: 1)
                    .frame(width: 18, height: 10)
                RoundedRectangle(cornerRadius: 1.5)
                    .frame(width: 15, height: 7)
                    .padding(.trailing, 2)
            }
            RoundedRectangle(cornerRadius: 1)
                .frame(width: 1.5, height: 4)
        }
    }
}

#Preview("Light") {
    StatusBarView(time: "9:41")
        .environment(\.barakaahTheme, BarakaahTheme(theme: .light, accent: .terracotta, sans: .sf, arabic: .amiri, fontScale: 0.95, radius: 22, blur: 28))
        .background(Color(hex: 0xF5EDE0))
}

#Preview("Dark") {
    StatusBarView(time: "9:41")
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .background(Color(hex: 0x1A1612))
}
