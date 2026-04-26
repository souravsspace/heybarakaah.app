import SwiftUI

struct PrayerTimesView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header
                VStack(spacing: 4) {
                    EyebrowText(text: GREGORIAN_TODAY)
                    Text("Brooklyn")
                        .font(theme.scaledSerif(size: 28, italic: true))
                        .foregroundStyle(theme.palette.txt)
                    Text(HIJRI_TODAY)
                        .font(.custom("Amiri-Regular", size: 14 * theme.fontScale))
                        .foregroundStyle(theme.palette.accent)
                        .environment(\.layoutDirection, .rightToLeft)
                }
                
                // Hero
                prayerHeroCard
                
                // Prayer list
                prayerListCard
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
        }
    }
    
    private var prayerHeroCard: some View {
        ZStack {
            Sigil(size: 150, strokeWidth: 0.5, color: theme.palette.accent)
                .opacity(0.12).offset(x: 60, y: 40).allowsHitTesting(false)
            
            VStack(spacing: 14) {
                EyebrowText(text: "Now praying", accent: true)
                
                HStack {
                    Text("ʿAṣr")
                        .font(theme.scaledSerif(size: 36, weight: .light))
                        .foregroundStyle(theme.palette.txt)
                    Spacer()
                    Text("العصر")
                        .font(.custom("Amiri-Regular", size: 22 * theme.fontScale))
                        .foregroundStyle(theme.palette.accent)
                }
                
                Capsule().fill(theme.palette.line).frame(height: 0.5)
                
                HStack {
                    infoCol(eyebrow: "Begins", value: "16:34")
                    Spacer()
                    infoCol(eyebrow: "Ends", value: "19:12")
                    Spacer()
                    infoCol(eyebrow: "Qibla", value: "58° NE")
                }
            }
            .padding(18)
        }
        .background {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(LinearGradient(
                    colors: [theme.palette.accent.opacity(0.18), theme.palette.accent.opacity(0.06)],
                    startPoint: .topLeading, endPoint: .bottomTrailing
                ))
        }
    }
    
    private func infoCol(eyebrow: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(eyebrow).font(theme.scaledSans(size: 10)).foregroundStyle(theme.palette.txt3)
            Text(value).font(theme.scaledSerif(size: 16)).foregroundStyle(theme.palette.txt)
        }
    }
    
    private var prayerListCard: some View {
        VStack(spacing: 0) {
            ForEach(Array(PRAYERS.enumerated()), id: \.element.id) { idx, prayer in
                let isPast = false // V1: static — all show active
                HStack {
                    Circle()
                        .strokeBorder(theme.palette.accent, lineWidth: 1.5)
                        .frame(width: 22, height: 22)
                        .overlay {
                            if state.completed[prayer.name] == true {
                                IconCheck().frame(width: 12, height: 12).foregroundStyle(theme.palette.accent)
                            }
                        }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 4) {
                            Text(prayer.name).font(theme.scaledSerif(size: 16)).foregroundStyle(isPast ? theme.palette.txt3 : theme.palette.txt)
                            if prayer.isSunnah {
                                Text("sunnah").font(theme.scaledSans(size: 10)).foregroundStyle(theme.palette.txt3).padding(.horizontal, 6).padding(.vertical, 2).background(Capsule().fill(theme.palette.glassBg))
                            }
                        }
                        Text(prayer.meta).font(theme.scaledSans(size: 12)).foregroundStyle(theme.palette.txt3)
                    }
                    
                    Spacer()
                    
                    Text(prayer.arabic)
                        .font(.custom("Amiri-Regular", size: 15 * theme.fontScale))
                        .foregroundStyle(theme.palette.txt2)
                    
                    Text(prayer.time)
                        .font(theme.scaledSerif(size: 16, weight: .light))
                        .foregroundStyle(isPast ? theme.palette.txt3 : theme.palette.txt)
                        .frame(width: 50, alignment: .trailing)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 12)
                .contentShape(Rectangle())
                .onTapGesture {
                    state.toggleCompleted(prayerName: prayer.name)
                }
                
                if idx < PRAYERS.count - 1 {
                    Capsule().fill(theme.palette.line).frame(height: 0.5).padding(.leading, 34)
                }
            }
        }
        .padding(4)
        .glass()
    }
}

#Preview {
    PrayerTimesView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
