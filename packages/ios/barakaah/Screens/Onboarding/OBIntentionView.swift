import SwiftUI

struct OBIntentionView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState

    var canContinue: Bool { !state.intentions.isEmpty }

    var body: some View {
        OnboardingFrame(
            step: 2,
            total: 9,
            eyebrow: "Niyyah · Intention",
            title: Text("What brings you ") + Text("here?").italic().foregroundColor(theme.palette.accent),
            sub: "Pick what matters most. Choose up to two.",
            canContinue: canContinue,
            onBack: { state.obStep = 1 },
            onNext: { state.obStep = 3 }
        ) {
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(Array(INTENTIONS.enumerated()), id: \.element.id) { idx, intention in
                        Button {
                            if state.intentions.contains(intention.id) {
                                state.intentions.remove(intention.id)
                            } else if state.intentions.count < 2 {
                                state.intentions.insert(intention.id)
                            }
                        } label: {
                            HStack(spacing: 12) {
                                Text(String(format: "%02d", idx + 1))
                                    .font(theme.scaledSerif(size: 12, italic: true))
                                    .foregroundStyle(theme.palette.txt3)
                                    .frame(width: 24)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(intention.title)
                                        .font(theme.scaledSerif(size: 16))
                                        .foregroundStyle(theme.palette.txt)
                                    Text(intention.sub)
                                        .font(theme.scaledSans(size: 12))
                                        .foregroundStyle(theme.palette.txt3)
                                }
                                
                                Spacer()
                                
                                Circle()
                                    .strokeBorder(
                                        state.intentions.contains(intention.id)
                                            ? theme.palette.accent
                                            : theme.palette.glassBorder,
                                        lineWidth: 1.5
                                    )
                                    .frame(width: 22, height: 22)
                                    .overlay {
                                        if state.intentions.contains(intention.id) {
                                            Circle()
                                                .fill(theme.palette.accent)
                                                .frame(width: 14, height: 14)
                                        }
                                    }
                            }
                            .padding(14)
                            .padding(.horizontal, 2)
                            .background {
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(
                                        state.intentions.contains(intention.id)
                                            ? LinearGradient(
                                                colors: [
                                                    theme.palette.accent.opacity(0.18),
                                                    theme.palette.accent.opacity(0.06)
                                                ],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                            : theme.palette.glassBg
                                    )
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .strokeBorder(
                                        state.intentions.contains(intention.id)
                                            ? theme.palette.accent.opacity(0.5)
                                            : theme.palette.glassBorder,
                                        lineWidth: 0.5
                                    )
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

#Preview {
    OBIntentionView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
