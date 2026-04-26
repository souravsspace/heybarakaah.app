import SwiftUI

struct GoalOption: Identifiable {
    let id: String
    let ayah: Int
    let dhikr: Int
    let label: String
    let sub: String
}

let GOALS: [GoalOption] = [
    GoalOption(id: "gentle", ayah: 1, dhikr: 33, label: "Gentle", sub: "1 āyah · 33 dhikr / day"),
    GoalOption(id: "consistent", ayah: 5, dhikr: 100, label: "Consistent", sub: "5 āyāt · 100 dhikr / day"),
    GoalOption(id: "devoted", ayah: 10, dhikr: 300, label: "Devoted", sub: "10 āyāt · 300 dhikr / day"),
]

struct OBGoalView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState

    var canContinue: Bool { !state.goal.isEmpty }

    var body: some View {
        OnboardingFrame(
            step: 6,
            total: 9,
            eyebrow: "Daily Practice",
            title: Text("Set your ") + Text("daily goal").italic().foregroundColor(theme.palette.accent),
            sub: "A small steady drop carves stone. Start where you are.",
            canContinue: canContinue,
            onBack: { state.obStep = 5 },
            onNext: { state.obStep = 7 }
        ) {
            VStack(spacing: 10) {
                ForEach(GOALS) { goal in
                    Button {
                        state.goal = goal.id
                    } label: {
                        HStack(spacing: 14) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(state.goal == goal.id ? theme.palette.accent : theme.palette.glassBg)
                                    .frame(width: 44, height: 44)
                                Text("\(goal.ayah)")
                                    .font(theme.scaledSerif(size: 18, italic: true))
                                    .foregroundStyle(state.goal == goal.id ? .white : theme.palette.txt3)
                            }
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(goal.label)
                                    .font(theme.scaledSerif(size: 17, italic: true))
                                    .foregroundStyle(theme.palette.txt)
                                Text(goal.sub)
                                    .font(theme.scaledSans(size: 12))
                                    .foregroundStyle(theme.palette.txt3)
                            }
                            
                            Spacer()
                        }
                        .padding(16)
                        .padding(.horizontal, 2)
                        .background {
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(
                                    state.goal == goal.id
                                        ? LinearGradient(
                                            colors: [theme.palette.accent.opacity(0.18), theme.palette.accent.opacity(0.06)],
                                            startPoint: .topLeading, endPoint: .bottomTrailing
                                        )
                                        : theme.palette.glassBg
                                )
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .strokeBorder(state.goal == goal.id ? theme.palette.accent.opacity(0.5) : theme.palette.glassBorder, lineWidth: 0.5)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    OBGoalView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
