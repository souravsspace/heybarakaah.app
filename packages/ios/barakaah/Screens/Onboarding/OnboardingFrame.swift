import SwiftUI

struct OnboardingFrame<Content: View>: View {
    @Environment(\.barakaahTheme) private var theme
    
    let step: Int
    let total: Int
    let eyebrow: String
    let title: Text
    var sub: String? = nil
    var primary: String = "Continue"
    var canContinue: Bool = true
    var secondary: String? = nil
    var onBack: (() -> Void)?
    var onNext: () -> Void
    var onSecondary: (() -> Void)?
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                if let onBack {
                    Button(action: onBack) {
                        IconChevronLeft()
                            .frame(width: 24, height: 24)
                    }
                    .frame(width: 38, height: 38)
                    .glass()
                } else {
                    Spacer().frame(width: 38, height: 38)
                }
                
                Spacer()
                
                EyebrowText(text: "Step \(String(format: "%02d", step + 1)) · \(String(format: "%02d", total))")
                
                Spacer()
                
                Spacer().frame(width: 38, height: 38)
            }
            .padding(.top, 20)
            
            Spacer().frame(height: 16)
            
            // Title
            title
                .font(theme.scaledSerif(size: 32, weight: .light))
                .foregroundStyle(theme.palette.txt)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            // Subtitle
            if let sub {
                Spacer().frame(height: 8)
                Text(sub)
                    .font(theme.scaledSans(size: 14))
                    .foregroundStyle(theme.palette.txt2)
                    .lineSpacing(14 * theme.fontScale * 0.5)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer().frame(height: 20)
            
            // Content slot
            content()
                .frame(maxHeight: .infinity)
            
            Spacer().frame(height: 8)
            
            // Footer
            VStack(spacing: 8) {
                PrimaryButton(action: onNext) {
                    HStack(spacing: 6) {
                        Text(primary)
                        IconArrowRight()
                            .frame(width: 14, height: 14)
                    }
                }
                .disabled(!canContinue)
                .opacity(canContinue ? 1 : 0.4)
                
                if let secondary, let onSecondary {
                    GhostButton(action: onSecondary) {
                        Text(secondary)
                    }
                }
            }
            
            Spacer().frame(height: 12)
            
            ProgressBars(step: step, total: total)
            
            Spacer().frame(height: 24)
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    OnboardingFrame(
        step: 1,
        total: 9,
        eyebrow: "Tell us your name",
        title: Text("What may we ") + Text("call you?").italic().foregroundColor(.accentColor),
        sub: "So your reminders feel personal.",
        onNext: {}
    ) {
        Color.clear.frame(height: 100)
    }
    .environment(\.barakaahTheme, BarakaahTheme.default)
    .environment(AppState())
}
