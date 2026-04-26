import SwiftUI

struct HomeView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                // Header
                headerRow
                
                // Next Prayer Hero
                nextPrayerCard
                
                // Daily Ayah
                dailyAyahCard
                
                // Quick Actions
                quickActionsRow
                
                // Bottom Row
                bottomRow
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
        }
    }

    // MARK: - Header
    private var headerRow: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                EyebrowText(text: "As-salāmu ʿalaykum")
                Text(state.name)
                    .font(theme.scaledSerif(size: 24, weight: .light, italic: true))
                    .foregroundStyle(theme.palette.txt)
            }
            Spacer()
            ZStack {
                Circle().fill(theme.palette.glassBg).frame(width: 40, height: 40)
                IconUser().frame(width: 16, height: 16).foregroundStyle(theme.palette.accent)
            }
        }
    }

    // MARK: - Next Prayer
    private var nextPrayerCard: some View {
        let np = state.nextPrayer
        return ZStack {
            Star8(size: 120, color: theme.palette.accent).opacity(0.12)
                .offset(x: 60, y: -20).allowsHitTesting(false)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    EyebrowText(text: "Next · \(np.prayer.name)", accent: true)
                    Text("in \(PrayerTimeMath.formatDiff(np.diff))")
                        .font(theme.scaledSerif(size: 16, italic: true))
                        .foregroundStyle(theme.palette.txt)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text(np.prayer.time)
                        .font(theme.scaledSerif(size: 28, weight: .light))
                        .foregroundStyle(theme.palette.txt)
                    Text("\(state.lockedAppsCount) apps will pause")
                        .font(theme.scaledSans(size: 11))
                        .foregroundStyle(theme.palette.txt3)
                }
            }
            .padding(16)
            .padding(.horizontal, 2)
        }
        .glass()
    }

    // MARK: - Daily Ayah
    private var dailyAyahCard: some View {
        let ayah = state.ayah
        return VStack(spacing: 16) {
            Ornament()
            
            EyebrowText(text: "Sūrat \(ayah.surah) · \(ayah.ref)", accent: true)
            
            Text(ayah.arabic)
                .font(.custom("Amiri-Regular", size: 24 * theme.fontScale))
                .foregroundStyle(theme.palette.txt)
                .lineSpacing(24 * theme.fontScale * 0.95)
                .multilineTextAlignment(.center)
            
            Text(ayah.translit)
                .font(theme.scaledSerif(size: 12, italic: true))
                .foregroundStyle(theme.palette.txt3)
            
            Text("\"\(ayah.translation)\"")
                .font(theme.scaledSerif(size: 14, italic: true))
                .foregroundStyle(theme.palette.txt2)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 12) {
                Spacer()
                circleIconButton(icon: IconBookmark(), action: {})
                circleIconButtonFilled(icon: IconRefresh()) {
                    state.ayahIndex += 1
                }
                circleIconButton(icon: IconShare(), action: {})
                Spacer()
            }
        }
        .padding(22)
        .padding(.horizontal, 2)
        .glass()
    }
    
    private func circleIconButton(icon: some View, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack {
                Circle().stroke(theme.palette.glassBorder, lineWidth: 0.5).frame(width: 36, height: 36)
                AnyView(icon).frame(width: 16, height: 16)
            }
        }
        .foregroundStyle(theme.palette.txt3)
    }
    
    private func circleIconButtonFilled(icon: some View, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack {
                Circle().fill(theme.palette.accent).frame(width: 36, height: 36)
                AnyView(icon).frame(width: 16, height: 16).foregroundStyle(.white)
            }
        }
    }

    // MARK: - Quick Actions
    private var quickActionsRow: some View {
        HStack(spacing: 10) {
            quickActionCard(
                icon: IconQuran(),
                label: "Qurʾān",
                caption: "Read & reflect"
            ) { state.pushScreen(.quran) }
            
            quickActionCard(
                icon: IconTasbih(),
                label: "Adhkār",
                caption: "Daily remembrance"
            ) { state.pushScreen(.adhkar) }
        }
    }
    
    private func quickActionCard(icon: some View, label: String, caption: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 8) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(theme.palette.accent.opacity(0.18))
                        .frame(width: 32, height: 32)
                    AnyView(icon).frame(width: 16, height: 16).foregroundStyle(theme.palette.accent)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(label)
                        .font(theme.scaledSerif(size: 14, italic: true))
                        .foregroundStyle(theme.palette.txt)
                    Text(caption)
                        .font(theme.scaledSans(size: 11))
                        .foregroundStyle(theme.palette.txt3)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(14)
        }
        .buttonStyle(.plain)
        .glass()
    }

    // MARK: - Bottom Row
    private var bottomRow: some View {
        HStack(spacing: 10) {
            Button {
                state.lockOpen = true
            } label: {
                VStack(spacing: 6) {
                    IconLock().frame(width: 20, height: 20)
                    Text("Lock screen").font(theme.scaledSans(size: 12)).foregroundStyle(theme.palette.txt2)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
            .buttonStyle(.plain)
            .glass()
            
            VStack(spacing: 6) {
                IconFlame().frame(width: 30, height: 30).foregroundStyle(theme.palette.accent)
                Text("Streak").font(theme.scaledSans(size: 10)).foregroundStyle(theme.palette.txt3)
                    .font(theme.scaledSans(size: 10))
                    .foregroundStyle(theme.palette.txt3)
                Text("23 days")
                    .font(theme.scaledSerif(size: 16))
                    .foregroundStyle(theme.palette.txt)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .glass()
        }
    }
}

#Preview {
    HomeView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
