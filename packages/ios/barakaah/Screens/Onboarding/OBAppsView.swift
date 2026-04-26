import SwiftUI

struct OBAppsView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState

    var body: some View {
        OnboardingFrame(
            step: 5,
            total: 9,
            eyebrow: "The Pause",
            title: Text("Which apps will ") + Text("pause?").italic().foregroundColor(theme.palette.accent),
            sub: "During Ṣalāh, these will gently stop until you've prayed. You can change anytime.",
            canContinue: true,
            onBack: { state.obStep = 4 },
            onNext: { state.obStep = 6 }
        ) {
            ScrollView {
                VStack(spacing: 6) {
                    ForEach(state.apps, id: \.id) { app in
                        Button {
                            state.toggleApp(id: app.id)
                        } label: {
                            HStack(spacing: 12) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(app.color)
                                        .frame(width: 38, height: 38)
                                    Text(String(app.name.prefix(1)))
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundStyle(.white)
                                }
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(app.name)
                                        .font(theme.scaledSans(size: 14.5, weight: .medium))
                                        .foregroundStyle(theme.palette.txt)
                                    Text(app.category)
                                        .font(theme.scaledSans(size: 11))
                                        .foregroundStyle(theme.palette.txt3)
                                }
                                
                                Spacer()
                                
                                Circle()
                                    .strokeBorder(app.selected ? theme.palette.accent : theme.palette.glassBorder, lineWidth: 1.5)
                                    .frame(width: 22, height: 22)
                                    .overlay {
                                        if app.selected {
                                            Circle().fill(theme.palette.accent).frame(width: 14)
                                        }
                                    }
                            }
                            .padding(11)
                            .padding(.horizontal, 3)
                            .background {
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .fill(app.selected ? theme.palette.accent.opacity(0.10) : theme.palette.glassBg)
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .strokeBorder(app.selected ? theme.palette.accent.opacity(0.5) : theme.palette.glassBorder, lineWidth: 0.5)
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
    OBAppsView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
