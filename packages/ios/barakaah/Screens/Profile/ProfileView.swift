import SwiftUI

struct ProfileView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        EyebrowText(text: "Your journey")
                        Text(state.name)
                            .font(theme.scaledSerif(size: 24, weight: .light, italic: true))
                            .foregroundStyle(theme.palette.txt)
                    }
                    Spacer()
                    Button {} label: {
                        IconSettings().frame(width: 18, height: 18)
                            .foregroundStyle(theme.palette.txt2)
                    }
                    .frame(width: 40, height: 40)
                    .glass()
                }
                
                // Streak hero
                streakHero
                
                // Stats grid
                statsGrid
                
                // Settings list
                settingsList
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
        }
    }
    
    private var streakHero: some View {
        ZStack {
            Star8(size: 180, color: theme.palette.accent).opacity(0.14)
                .offset(x: 60, y: -30).allowsHitTesting(false)
            
            VStack(spacing: 8) {
                EyebrowText(text: "Current streak", accent: true)
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text("23")
                        .font(theme.scaledSerif(size: 64, weight: .light))
                        .foregroundStyle(theme.palette.txt)
                    Text("days")
                        .font(theme.scaledSerif(size: 16, italic: true))
                        .foregroundStyle(theme.palette.accent)
                }
                Text("All five fardh, every day. Allāhumma bārik.")
                    .font(theme.scaledSans(size: 13))
                    .foregroundStyle(theme.palette.txt3)
                    .multilineTextAlignment(.center)
            }
            .padding(20)
        }
        .background {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(LinearGradient(
                    colors: [theme.palette.accent.opacity(0.18), theme.palette.accent.opacity(0.06)],
                    startPoint: .topLeading, endPoint: .bottomTrailing
                ))
        }
    }
    
    private var statsGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
            statCard(eyebrow: "Today", value: "5/5", sub: "fardh")
            statCard(eyebrow: "This week", value: "35/35", sub: "completed")
            statCard(eyebrow: "Saved", value: "12h", sub: "from scrolling")
            statCard(eyebrow: "Ayāt", value: "142", sub: "read")
        }
    }
    
    private func statCard(eyebrow: String, value: String, sub: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(eyebrow).font(theme.scaledSans(size: 10)).foregroundStyle(theme.palette.txt3)
            Text(value).font(theme.scaledSerif(size: 22)).foregroundStyle(theme.palette.txt)
            Text(sub).font(theme.scaledSans(size: 11)).foregroundStyle(theme.palette.txt3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .glass()
    }
    
    private var settingsList: some View {
        VStack(spacing: 0) {
            settingsRow(icon: IconLock(), label: "Locked apps", value: "\(state.lockedAppsCount) apps")
            { state.pushScreen(.appEditor) }
            Divider().background(theme.palette.line).padding(.leading, 44)
            settingsRow(icon: IconBell(), label: "Notifications", value: "On") {}
            Divider().background(theme.palette.line).padding(.leading, 44)
            settingsRow(icon: IconLocation(), label: "Location & method", value: "ISNA · Hanafi") {}
            Divider().background(theme.palette.line).padding(.leading, 44)
            settingsRow(icon: IconSun(), label: "Theme", value: "Auto") {}
        }
        .padding(4).padding(.horizontal, 4)
        .glass()
    }
    
    private func settingsRow(icon: some View, label: String, value: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(theme.palette.accent.opacity(0.12))
                        .frame(width: 32, height: 32)
                    AnyView(icon).frame(width: 16, height: 16).foregroundStyle(theme.palette.accent)
                }
                Text(label).font(theme.scaledSans(size: 14, weight: .medium)).foregroundStyle(theme.palette.txt)
                Spacer()
                Text(value).font(theme.scaledSans(size: 12)).foregroundStyle(theme.palette.txt3)
                IconChevronRight().frame(width: 14, height: 14).foregroundStyle(theme.palette.txt4)
            }
            .padding(.vertical, 12).padding(.horizontal, 8)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ProfileView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
