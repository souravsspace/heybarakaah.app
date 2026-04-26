import SwiftUI

struct OBReadyView: View {
    @Environment(\.barakaahTheme) private var theme
    @Environment(AppState.self) private var state
    
    @State private var breathe = false

    private var nextP: (prayer: Prayer, diff: Int) {
        state.nextPrayer
    }

    var body: some View {
        ZStack {
            Color.bgGradient(for: theme.theme).ignoresSafeArea()
            
            // Ambient blob
            Circle()
                .fill(
                    RadialGradient(
                        colors: [theme.palette.accent.opacity(0.18), .clear],
                        center: .top, startRadius: 0, endRadius: 280
                    )
                )
                .frame(width: 280, height: 280)
                .blur(radius: 50)
                .offset(y: -120)
                .allowsHitTesting(false)
            
            VStack(spacing: 0) {
                Spacer()
                
                Sigil(size: 88, strokeWidth: 0.7, color: theme.palette.accent)
                    .scaleEffect(breathe ? 1.06 : 1.0)
                    .opacity(breathe ? 0.85 : 0.5)
                    .animation(.easeInOut(duration: 5).repeatForever(autoreverses: true), value: breathe)
                
                Spacer().frame(height: 28)
                
                EyebrowText(text: "Bismillāh", accent: true)
                
                Spacer().frame(height: 8)
                
                Group {
                    Text("You're ")
                        .font(theme.scaledSerif(size: 36, weight: .light))
                        .foregroundStyle(theme.palette.txt)
                    + Text("ready")
                        .font(theme.scaledSerif(size: 36, italic: true))
                        .foregroundStyle(theme.palette.accent)
                    + Text(", ")
                        .font(theme.scaledSerif(size: 36, weight: .light))
                        .foregroundStyle(theme.palette.txt)
                    + Text(state.name)
                        .font(theme.scaledSerif(size: 36, italic: true))
                        .foregroundStyle(theme.palette.accent)
                }
                .multilineTextAlignment(.center)
                
                Spacer().frame(height: 12)
                
                Group {
                    Text("Your next prayer is ")
                        .font(theme.scaledSans(size: 14))
                        .foregroundStyle(theme.palette.txt2)
                    + Text("\(nextP.prayer.name) at \(nextP.prayer.time)")
                        .font(theme.scaledSans(size: 14, weight: .medium))
                        .foregroundStyle(theme.palette.txt)
                    + Text(". May your hours be unhurried.")
                        .font(theme.scaledSans(size: 14))
                        .foregroundStyle(theme.palette.txt2)
                }
                .multilineTextAlignment(.center)
                
                Spacer()
                
                PrimaryButton(action: { state.phase = .app }) {
                    Text("Enter Barakaah")
                }
                
                Spacer().frame(height: 12)
                
                ProgressBars(step: 8, total: 9)
                
                Spacer().frame(height: 28)
            }
            .padding(.horizontal, 28)
            .padding(.top, 40)
        }
        .onAppear { breathe = true }
    }
}

#Preview {
    OBReadyView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .environment(AppState())
}
