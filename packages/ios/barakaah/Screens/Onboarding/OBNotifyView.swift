import SwiftUI

struct OBNotifyView: View {
    @Environment(\.barakaahTheme) private var theme
    @Environment(AppState.self) private var state

    var body: some View {
        OnboardingFrame(
            step: 7,
            total: 9,
            eyebrow: "Gentle Reminders",
            title: Text("A whisper before ") + Text("each Ṣalāh").italic().foregroundColor(theme.palette.accent),
            sub: "A short notification five minutes before — soft, never alarming. Adhān is optional.",
            primary: "Allow notifications",
            onBack: { state.obStep = 6 },
            onNext: { state.obStep = 8 }
        ) {
            VStack(spacing: 12) {
                Spacer()
                
                // Notification preview card
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                .fill(theme.palette.accent)
                                .frame(width: 24, height: 24)
                            Text("ب")
                                .font(.custom("Fraunces-VariableFont", size: 13 * theme.fontScale))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                        
                        EyebrowText(text: "BARAKAAH", accent: true)
                        
                        Spacer()
                        
                        Text("now")
                            .font(theme.scaledSans(size: 11))
                            .foregroundStyle(theme.palette.txt4)
                    }
                    
                    Text("ʿAṣr is in 5 minutes")
                        .font(theme.scaledSans(size: 14, weight: .medium))
                        .foregroundStyle(theme.palette.txt)
                    
                    Text("حَيَّ عَلَى ٱلصَّلَاةِ")
                        .font(.custom("Amiri-Regular", size: 18 * theme.fontScale))
                        .foregroundStyle(theme.palette.accent)
                        .lineSpacing(18 * theme.fontScale * 0.7)
                    
                    Text("Hayya ʿalā ṣ-ṣalāh — come to prayer.")
                        .font(theme.scaledSans(size: 12.5))
                        .foregroundStyle(theme.palette.txt2)
                }
                .padding(18)
                .glass()
                
                Spacer()
            }
        }
    }
}

#Preview {
    OBNotifyView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .environment(AppState())
}
