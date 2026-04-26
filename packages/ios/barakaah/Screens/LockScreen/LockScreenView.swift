import SwiftUI

struct LockScreenView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState
    @State private var breathe = false

    private var currentPrayer: Prayer {
        state.nextPrayer.prayer
    }

    var body: some View {
        ZStack {
            // Dark background
            RadialGradient(
                colors: [theme.palette.accent.opacity(0.16), Color(hex: 0x1A1612)],
                center: .top, startRadius: 0, endRadius: 400
            ).ignoresSafeArea()
            
            Color(hex: 0x1A1612).ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                Star8(size: 320, color: theme.palette.accent)
                    .opacity(0.18)
                    .scaleEffect(breathe ? 1.04 : 1.0)
                    .animation(.easeInOut(duration: 5).repeatForever(autoreverses: true), value: breathe)
                    .allowsHitTesting(false)
                
                Spacer().frame(height: 40)
                
                EyebrowText(text: "\(currentPrayer.name) · \(currentPrayer.time)", accent: true)
                
                Spacer().frame(height: 12)
                
                Group {
                    Text("Have you prayed\n")
                        .font(theme.scaledSerif(size: 36, weight: .light))
                        .foregroundStyle(theme.palette.cream)
                    + Text(currentPrayer.name)
                        .font(theme.scaledSerif(size: 36, italic: true))
                        .foregroundStyle(theme.palette.accent)
                    + Text("?")
                        .font(theme.scaledSerif(size: 36, weight: .light))
                        .foregroundStyle(theme.palette.cream)
                }
                .multilineTextAlignment(.center)
                
                Spacer().frame(height: 8)
                
                Text("Instagram, X, and TikTok are paused.")
                    .font(theme.scaledSans(size: 13))
                    .foregroundStyle(theme.palette.cream3)
                
                Spacer().frame(height: 24)
                
                // Lock ayah card
                VStack(spacing: 8) {
                    Text(LOCK_AYAHS[0].arabic)
                        .font(.custom("Amiri-Regular", size: 22 * theme.fontScale))
                        .foregroundStyle(theme.palette.cream)
                        .lineSpacing(22 * theme.fontScale * 0.95)
                        .multilineTextAlignment(.center)
                    
                    Text("\"\(LOCK_AYAHS[0].translation)\"")
                        .font(theme.scaledSerif(size: 13, italic: true))
                        .foregroundStyle(theme.palette.cream2)
                        .multilineTextAlignment(.center)
                    
                    EyebrowText(text: LOCK_AYAHS[0].ref)
                }
                .padding(20)
                .padding(.horizontal, 2)
                .glass()
                
                Spacer()
                
                PrimaryButton(action: {
                    state.toggleCompleted(prayerName: currentPrayer.name)
                    state.lockOpen = false
                }) {
                    HStack(spacing: 6) {
                        IconCheck().frame(width: 16, height: 16)
                        Text("Yes — alḥamdulillāh")
                    }
                }
                
                Spacer().frame(height: 10)
                
                Button {
                    state.lockOpen = false
                } label: {
                    Text("Not yet — remind me")
                        .font(theme.scaledSans(size: 14))
                        .foregroundStyle(theme.palette.cream3)
                }
                
                Spacer().frame(height: 28)
            }
            .padding(.horizontal, 28)
        }
        .overlay(alignment: .topTrailing) {
            Button {
                state.lockOpen = false
            } label: {
                IconClose().frame(width: 16, height: 16)
                    .foregroundStyle(theme.palette.cream)
                    .frame(width: 34, height: 34)
                    .background(Circle().fill(Color.white.opacity(0.06)))
            }
            .padding(20)
        }
        .onAppear { breathe = true }
    }
}

#Preview {
    LockScreenView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
