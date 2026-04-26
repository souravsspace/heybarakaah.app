import SwiftUI

struct OBLocationView: View {
    @Environment(\.barakaahTheme) private var theme
    @Environment(AppState.self) private var state

    @State private var pulse = false

    var body: some View {
        OnboardingFrame(
            step: 4,
            total: 9,
            eyebrow: "Prayer Times",
            title: Text("Where do you ") + Text("pray?").italic().foregroundColor(theme.palette.accent),
            sub: "Your timezone tells us when each Ṣalāh begins. Used only for prayer-time calculation.",
            primary: "Allow location",
            secondary: "Enter manually",
            onBack: { state.obStep = 3 },
            onNext: { state.obStep = 5 },
            onSecondary: { state.obStep = 5 }
        ) {
            ZStack {
                Sigil(size: 150, strokeWidth: 0.5, color: theme.palette.accent)
                    .opacity(0.10)
                    .offset(x: 40, y: -30)
                    .allowsHitTesting(false)
                
                VStack(spacing: 16) {
                    HStack(spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(theme.palette.accent.opacity(0.15))
                                .frame(width: 42, height: 42)
                            
                            Circle()
                                .stroke(theme.palette.accent, lineWidth: 1.5)
                                .frame(width: 42, height: 42)
                                .scaleEffect(pulse ? 1.6 : 1.0)
                                .opacity(pulse ? 0 : 0.6)
                                .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: pulse)
                            
                            IconLocation()
                                .frame(width: 18, height: 18)
                                .foregroundStyle(theme.palette.accent)
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            EyebrowText(text: "Detected location")
                            Text("Brooklyn, New York")
                                .font(theme.scaledSerif(size: 18, italic: true))
                                .foregroundStyle(theme.palette.txt)
                        }
                        
                        Spacer()
                    }
                    
                    Capsule()
                        .fill(theme.palette.line)
                        .frame(height: 0.5)
                    
                    VStack(spacing: 8) {
                        HStack {
                            Text("Method").foregroundStyle(theme.palette.txt3)
                            Spacer()
                            Text("ISNA").foregroundStyle(theme.palette.txt)
                        }
                        .font(theme.scaledSans(size: 13))
                        
                        HStack {
                            Text("Coords").foregroundStyle(theme.palette.txt3)
                            Spacer()
                            Text("40.6782°N, 73.9442°W").foregroundStyle(theme.palette.txt)
                        }
                        .font(theme.scaledSans(size: 13))
                    }
                }
                .padding(24)
                .padding(.vertical, 2)
                .glass()
            }
            .onAppear { pulse = true }
        }
    }
}

#Preview {
    OBLocationView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .environment(AppState())
}
