import SwiftUI

struct OBNameView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState
    @FocusState private var isFocused: Bool

    var canContinue: Bool {
        !state.name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        OnboardingFrame(
            step: 1,
            total: 9,
            eyebrow: "Tell us your name",
            title: Text("What may we ") + Text("call you?").italic().foregroundColor(theme.palette.accent),
            sub: "So your reminders feel personal. You can change this anytime.",
            canContinue: canContinue,
            onBack: { state.obStep = 0 },
            onNext: { state.obStep = 2 }
        ) {
            VStack(spacing: 24) {
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(theme.palette.accent.opacity(0.3), lineWidth: 1)
                        .frame(width: 96, height: 96)
                        .glass()
                    
                    IconUser()
                        .frame(width: 36, height: 36)
                        .foregroundStyle(theme.palette.accent)
                }
                
                TextField("Your name", text: $state.name)
                    .font(theme.scaledSerif(size: 18, italic: true))
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.plain)
                    .padding(18)
                    .padding(.horizontal, 2)
                    .glass()
                    .focused($isFocused)
                
                Text("Stored on this device only.")
                    .font(theme.scaledSans(size: 12))
                    .foregroundStyle(theme.palette.txt3)
                
                Spacer()
            }
            .onAppear { isFocused = true }
        }
    }
}

#Preview {
    OBNameView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
