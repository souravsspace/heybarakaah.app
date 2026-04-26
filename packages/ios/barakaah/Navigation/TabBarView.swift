import SwiftUI

struct TabBarView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState

    var body: some View {
        HStack(spacing: 2) {
            ForEach(Array(Tab.allCases), id: \.self) { tab in
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                        state.tab = tab
                    }
                } label: {
                    VStack(spacing: 2) {
                        icon(for: tab)
                            .frame(width: 20, height: 20)
                        Text(label(for: tab))
                            .font(theme.scaledSans(size: 9.5, weight: .semibold))
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 4)
                    .padding(.bottom, 6)
                    .foregroundStyle(
                        state.tab == tab
                            ? theme.palette.accent
                            : theme.palette.txt3
                    )
                    .background {
                        if state.tab == tab {
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .fill(activeBackgroundColor)
                                .shadow(color: .black.opacity(0.06), radius: 2, y: 1)
                        }
                    }
                }
            }
        }
        .padding(4)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 32, style: .continuous))
        .background(
            theme.palette.glassBgStrong
                .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
        )
        .overlay {
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .strokeBorder(theme.palette.glassBorder, lineWidth: 0.5)
        }
        .overlay {
            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 32, style: .continuous)
                    .fill(
                        theme.theme == .light
                            ? Color.white.opacity(0.55)
                            : Color.white.opacity(0.06)
                    )
                    .frame(height: 1)
                Spacer()
            }
            .mask {
                RoundedRectangle(cornerRadius: 32, style: .continuous)
            }
        }
        .shadow(
            color: theme.theme == .light
                ? theme.palette.espresso.opacity(0.18)
                : Color.black.opacity(0.45),
            radius: 28,
            y: 12
        )
        .padding(.horizontal, 14)
        .padding(.bottom, 4)
    }

    private var activeBackgroundColor: Color {
        theme.theme == .light
            ? Color.white.opacity(0.65)
            : Color.white.opacity(0.10)
    }

    private func icon(for tab: Tab) -> some View {
        group(for: tab)
            .foregroundStyle(state.tab == tab ? theme.palette.accent : theme.palette.txt3)
            .frame(width: 20, height: 20)
    }

    @ViewBuilder
    private func group(for tab: Tab) -> some View {
        switch tab {
        case .home:
            IconHome()
                .frame(width: 20, height: 20)
        case .salah:
            IconSalah()
                .frame(width: 20, height: 20)
        case .tasbih:
            IconTasbih()
                .frame(width: 20, height: 20)
        case .profile:
            IconUser()
                .frame(width: 20, height: 20)
        }
    }

    private func label(for tab: Tab) -> String {
        switch tab {
        case .home:    return "Home"
        case .salah:   return "Ṣalāh"
        case .tasbih:  return "Dhikr"
        case .profile: return "You"
        }
    }
}

#Preview {
    TabBarView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .background(Color(hex: 0x1A1612))
        .frame(height: 120)
}
