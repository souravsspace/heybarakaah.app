import SwiftUI

struct QuranReaderView: View {
    @Environment(\.barakaahTheme) private var theme
    @Environment(AppState.self) private var state

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header
                HStack {
                    Button { state.popScreen() } label: {
                        IconChevronLeft().frame(width: 24, height: 24)
                    }
                    .frame(width: 38, height: 38).glass()

                    VStack(spacing: 2) {
                        EyebrowText(text: "S\u{016B}rah 1")
                        Text("Al-F\u{0101}ti\u{1E25}ah")
                            .font(theme.scaledSerif(size: 18, italic: true))
                            .foregroundStyle(theme.palette.txt)
                    }

                    Spacer()

                    Button {} label: {
                        IconHeadphones().frame(width: 18, height: 18)
                    }
                    .frame(width: 38, height: 38).glass()
                }

                // Bismillah
                VStack(spacing: 8) {
                    Ornament()
                    Text("\u{0628}\u{0650}\u{0633}\u{0652}\u{0645}\u{0650} \u{0671}\u{0644}\u{0644}\u{064E}\u{0651}\u{0647}\u{0650} \u{0671}\u{0644}\u{0631}\u{064E}\u{0651}\u{062D}\u{0652}\u{0645}\u{064E}\u{0640}\u{0670}\u{0646}\u{0650} \u{0671}\u{0644}\u{0631}\u{064E}\u{0651}\u{062D}\u{0650}\u{064A}\u{0645}\u{0650}")
                        .font(.custom("Amiri-Regular", size: 22 * theme.fontScale))
                        .foregroundStyle(theme.palette.accent)
                        .multilineTextAlignment(.center)
                }

                // Verse cards
                ForEach(FATIHA_VERSES) { verse in
                    VStack(spacing: 12) {
                        HStack {
                            ZStack {
                                Star8(size: 28, color: theme.palette.accent)
                                Text("\(verse.n)")
                                    .font(theme.scaledSerif(size: 10))
                                    .foregroundStyle(theme.palette.accent)
                            }
                            Spacer()
                            Button {} label: {
                                IconBookmark().frame(width: 18, height: 18)
                                    .foregroundStyle(theme.palette.txt4)
                            }
                            Button {} label: {
                                IconShare().frame(width: 18, height: 18)
                                    .foregroundStyle(theme.palette.txt4)
                            }
                        }

                        Text(verse.arabic)
                            .font(.custom("Amiri-Regular", size: 24 * theme.fontScale))
                            .foregroundStyle(theme.palette.txt)
                            .lineSpacing(24 * theme.fontScale * 1.0)
                            .multilineTextAlignment(.trailing)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .environment(\.layoutDirection, .rightToLeft)

                        Text(verse.translit)
                            .font(theme.scaledSerif(size: 12, italic: true))
                            .foregroundStyle(theme.palette.txt3)

                        Text(verse.translation)
                            .font(theme.scaledSerif(size: 14, italic: true))
                            .foregroundStyle(theme.palette.txt2)
                            .lineSpacing(4)
                    }
                    .padding(18)
                    .glass()
                }
            }
            .padding(.horizontal, 20).padding(.vertical, 8)
        }
    }
}

#Preview {
    QuranReaderView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .environment(AppState())
}
