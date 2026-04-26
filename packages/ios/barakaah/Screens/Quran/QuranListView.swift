import SwiftUI

struct QuranListView: View {
    @Environment(\.barakaahTheme) private var theme
    @Environment(AppState.self) private var state
    @State private var search = ""

    var filteredSurahs: [Surah] {
        if search.isEmpty { return SURAHS }
        return SURAHS.filter { surah in
            surah.name.localizedCaseInsensitiveContains(search) ||
            surah.arabic.localizedCaseInsensitiveContains(search) ||
            String(surah.num).contains(search)
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header
                HStack {
                    Button { state.popScreen() } label: {
                        IconChevronLeft().frame(width: 24, height: 24)
                    }
                    .frame(width: 38, height: 38).glass()

                    VStack(alignment: .leading, spacing: 2) {
                        EyebrowText(text: "Al-Qur\u{02BE}\u{0101}n")
                        Text("The Recitation")
                            .font(theme.scaledSerif(size: 22, italic: true))
                            .foregroundStyle(theme.palette.txt)
                    }
                    Spacer()
                }

                // Continue reading
                Button {} label: {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(theme.palette.accent).frame(width: 44, height: 44)
                            IconPlay().frame(width: 18, height: 18).foregroundStyle(.white)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            EyebrowText(text: "Continue", accent: true)
                            Text("Al-F\u{0101}ti\u{1E25}ah \u{00B7} 1:3")
                                .font(theme.scaledSerif(size: 16, italic: true))
                                .foregroundStyle(theme.palette.txt)
                        }
                        Spacer()
                        IconChevronRight().frame(width: 16, height: 16)
                            .foregroundStyle(theme.palette.txt3)
                    }
                    .padding(14)
                }
                .buttonStyle(.plain)
                .background {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(LinearGradient(
                            colors: [theme.palette.accent.opacity(0.18), theme.palette.accent.opacity(0.06)],
                            startPoint: .topLeading, endPoint: .bottomTrailing
                        ))
                }

                // Search
                HStack(spacing: 10) {
                    IconSearch().frame(width: 16, height: 16).foregroundStyle(theme.palette.txt3)
                    TextField("Search s\u{016B}rahs...", text: $search)
                        .textFieldStyle(.plain)
                        .font(theme.scaledSans(size: 14))
                }
                .padding(10).padding(.horizontal, 4)
                .glass()

                // Surah list
                VStack(spacing: 0) {
                    ForEach(Array(filteredSurahs.enumerated()), id: \.element.id) { idx, surah in
                        Button {
                            state.pushScreen(.quran)
                        } label: {
                            HStack(spacing: 12) {
                                ZStack {
                                    Star8(size: 36, color: theme.palette.accent)
                                    Text("\(surah.num)")
                                        .font(theme.scaledSerif(size: 12))
                                        .foregroundStyle(theme.palette.accent)
                                }
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(surah.name)
                                        .font(theme.scaledSerif(size: 15))
                                        .foregroundStyle(theme.palette.txt)
                                    Text("\(surah.place) \u{00B7} \(surah.ayat) \u{0101}y\u{0101}t")
                                        .font(theme.scaledSans(size: 11))
                                        .foregroundStyle(theme.palette.txt3)
                                }
                                Spacer()
                                Text(surah.arabic)
                                    .font(.custom("Amiri-Regular", size: 18 * theme.fontScale))
                                    .foregroundStyle(theme.palette.txt2)
                            }
                            .padding(.vertical, 10).padding(.horizontal, 8)
                        }
                        .buttonStyle(.plain)

                        if idx < filteredSurahs.count - 1 {
                            Capsule()
                                .fill(theme.palette.line)
                                .frame(height: 0.5)
                                .padding(.leading, 48)
                        }
                    }
                }
                .padding(4).padding(.horizontal, 4)
                .glass()
            }
            .padding(.horizontal, 20).padding(.vertical, 8)
        }
    }
}

#Preview {
    QuranListView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .environment(AppState())
}
