import SwiftUI

struct AppShellView<Content: View>: View {
    @Environment(\.barakaahTheme) private var theme
    @Environment(AppState.self) private var appState

    @ViewBuilder let content: () -> Content

    var body: some View {
        ZStack {
            Color.bgGradient(for: theme.theme)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                if BarakaahPreviewShell.enabled {
                    DynamicIslandView()
                        .padding(.top, 11)
                        .zIndex(2)
                }

                StatusBarView()

                ZStack {
                    content()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                    if appState.lockOpen {
                        Color(hex: 0x1A1612).opacity(0.95)
                            .ignoresSafeArea()
                            .transition(.opacity)
                    }
                }
            }

            if BarakaahPreviewShell.enabled {
                HomeIndicatorView()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .ignoresSafeArea(.keyboard)
            }
        }
    }
}

#Preview {
    AppShellView {
        VStack {
            Text("Barakaah")
                .font(.largeTitle)
                .foregroundStyle(.primary)
        }
    }
    .environment(\.barakaahTheme, BarakaahTheme.default)
    .environment(AppState())
}
