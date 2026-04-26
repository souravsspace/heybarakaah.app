import SwiftUI

struct SplashView: View {
    @Environment(\.barakaahTheme) private var theme
    @Environment(AppState.self) private var state
    
    @State private var breathe = false

    var body: some View {
        ZStack {
            Color.bgGradient(for: theme.theme)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                Star8(size: 88, color: theme.palette.accent, strokeWidth: 0.8)
                    .scaleEffect(breathe ? 1.06 : 1.0)
                    .opacity(breathe ? 0.85 : 0.5)
                    .animation(
                        .easeInOut(duration: 3).repeatForever(autoreverses: true),
                        value: breathe
                    )
                
                Spacer().frame(height: 32)
                
                Text("بركة")
                    .font(.custom("Amiri-Regular", size: 44 * theme.fontScale))
                    .kerning(44 * theme.fontScale * 0.02)
                    .foregroundStyle(theme.palette.cream)
                
                Spacer().frame(height: 14)
                
                Text("BARAKAAH")
                    .font(theme.scaledSans(size: 12, weight: .semibold))
                    .kerning(12 * theme.fontScale * 0.34)
                    .textCase(.uppercase)
                    .foregroundStyle(theme.palette.cream3)
                
                Spacer().frame(height: 18)
                
                Ornament()
                
                Spacer().frame(height: 18)
                
                Text("tranquility, by design")
                    .font(theme.scaledSerif(size: 13, italic: true))
                    .foregroundStyle(theme.palette.cream4)
                
                Spacer()
            }
            .padding(32)
        }
        .onAppear {
            breathe = true
            Task {
                try? await Task.sleep(for: .seconds(2.2))
                state.phase = .onboarding
            }
        }
    }
}

#Preview {
    SplashView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .environment(AppState())
}
