import SwiftUI

struct OBMadhhabView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState

    var body: some View {
        OnboardingFrame(
            step: 3,
            total: 9,
            eyebrow: "School of thought",
            title: Text("Choose your ") + Text("madhhab").italic().foregroundColor(theme.palette.accent),
            sub: "Affects calculation method and prayer-time conventions. You can skip if unsure.",
            canContinue: !state.madhhab.isEmpty,
            secondary: "Not sure — use default",
            onBack: { state.obStep = 2 },
            onNext: { state.obStep = 4 },
            onSecondary: {
                state.madhhab = "hanafi"
                state.obStep = 4
            }
        ) {
            ScrollView {
                VStack(spacing: 6) {
                    ForEach(MADHHABS, id: \.id) { madhhab in
                        Button {
                            state.madhhab = madhhab.id
                        } label: {
                            HStack(spacing: 12) {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(madhhab.name)
                                        .font(theme.scaledSerif(size: 15))
                                        .foregroundStyle(theme.palette.txt)
                                    Text(madhhab.sub)
                                        .font(theme.scaledSans(size: 11.5))
                                        .foregroundStyle(theme.palette.txt3)
                                }
                                Spacer()
                                Circle()
                                    .strokeBorder(
                                        state.madhhab == madhhab.id
                                            ? theme.palette.accent
                                            : theme.palette.glassBorder,
                                        lineWidth: 1.5
                                    )
                                    .frame(width: 18, height: 18)
                                    .overlay {
                                        if state.madhhab == madhhab.id {
                                            Circle().fill(theme.palette.accent).frame(width: 10)
                                        }
                                    }
                            }
                            .padding(13)
                            .padding(.horizontal, 2)
                            .background {
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .fill(
                                        state.madhhab == madhhab.id
                                            ? theme.palette.accent.opacity(0.12)
                                            : theme.palette.glassBg
                                    )
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .strokeBorder(
                                        state.madhhab == madhhab.id
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
    OBMadhhabView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
