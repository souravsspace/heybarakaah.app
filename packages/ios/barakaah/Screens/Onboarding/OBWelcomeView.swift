import SwiftUI

struct OBWelcomeView: View {
    @Environment(\.barakaahTheme) private var theme
    @Environment(AppState.self) private var state
    
    @State private var breathe = false

    var body: some View {
        ZStack {
            Color.bgGradient(for: theme.theme).ignoresSafeArea()
            
            // Ambient blobs
            Circle()
                .fill(
                    RadialGradient(
                        colors: [theme.palette.accent.opacity(0.15), .clear],
                        center: .topLeading, startRadius: 0, endRadius: 120
                    )
                )
                .frame(width: 200, height: 200)
                .blur(radius: 40)
                .offset(x: -80, y: -60)
                .allowsHitTesting(false)
            
            Circle()
                .fill(
                    RadialGradient(
                        colors: [theme.palette.accent.opacity(0.12), .clear],
                        center: .bottomTrailing, startRadius: 0, endRadius: 140
                    )
                )
                .frame(width: 180, height: 180)
                .blur(radius: 50)
                .offset(x: 80, y: 80)
                .allowsHitTesting(false)
            
            VStack(spacing: 0) {
                Spacer()
                
                Star8(size: 76, color: theme.palette.accent, strokeWidth: 0.8)
                    .scaleEffect(breathe ? 1.06 : 1.0)
                    .opacity(breathe ? 0.85 : 0.5)
                    .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: breathe)
                
                Spacer().frame(height: 24)
                
                EyebrowText(text: "As-salāmu ʿalaykum", accent: true)
                
                Spacer().frame(height: 8)
                
                Group {
                    Text("Welcome to ")
                        .font(theme.scaledSerif(size: 38, weight: .light))
                        .foregroundStyle(theme.palette.txt)
                    + Text("Barakaah")
                        .font(theme.scaledSerif(size: 38, italic: true))
                        .foregroundStyle(theme.palette.accent)
                }
                .multilineTextAlignment(.center)
                
                Spacer().frame(height: 8)
                
                Text("Turn the hours you'd lose to scrolling\ninto moments of remembrance.")
                    .font(theme.scaledSans(size: 15))
                    .foregroundStyle(theme.palette.txt3)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .frame(maxWidth: 290)
                
                Spacer().frame(height: 32)
                
                // Ayah card
                VStack(spacing: 8) {
                    Text(AYAHS[1].arabic)
                        .font(.custom("Amiri-Regular", size: 24 * theme.fontScale))
                        .foregroundStyle(theme.palette.txt)
                        .lineSpacing(24 * theme.fontScale * 0.75)
                        .multilineTextAlignment(.center)
                    
                    Text(AYAHS[1].ref)
                        .font(theme.scaledSerif(size: 12, italic: true))
                        .foregroundStyle(theme.palette.txt3)
                }
                .padding(18)
                .padding(.horizontal, 4)
                .glass()
                .frame(maxWidth: 300)
                
                Spacer()
                
                PrimaryButton(action: { state.obStep = 1 }) {
                    Text("Begin")
                }
                
                Spacer().frame(height: 8)
                
                Button("I have an account") {}
                    .font(theme.scaledSans(size: 13))
                    .foregroundStyle(theme.palette.txt3)
                
                Spacer().frame(height: 28)
            }
            .padding(.horizontal, 28)
            .padding(.top, 40)
        }
        .onAppear { breathe = true }
    }
}

#Preview {
    OBWelcomeView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .environment(AppState())
}
