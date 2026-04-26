import SwiftUI

struct AdhkarView: View {
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

                    VStack(alignment: .leading, spacing: 2) {
                        EyebrowText(text: "Adhk\u{0101}r")
                        Text("Daily Remembrance")
                            .font(theme.scaledSerif(size: 22, italic: true))
                            .foregroundStyle(theme.palette.txt)
                    }
                    Spacer()
                }

                // Time-of-day banner
                Button {} label: {
                    HStack(spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(theme.palette.accent.opacity(0.2))
                                .frame(width: 38, height: 38)
                            IconSun().frame(width: 18, height: 18)
                                .foregroundStyle(theme.palette.accent)
                        }
                        VStack(alignment: .leading, spacing: 2) {
                            EyebrowText(text: "Right now", accent: true)
                            Text("Morning adhk\u{0101}r \u{2014} until midday")
                                .font(theme.scaledSerif(size: 14, italic: true))
                                .foregroundStyle(theme.palette.txt)
                        }
                        Spacer()
                        IconChevronRight().frame(width: 16, height: 16)
                            .foregroundStyle(theme.palette.txt3)
                    }
                    .padding(14).padding(.horizontal, 2)
                }
                .buttonStyle(.plain)
                .background {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(LinearGradient(
                            colors: [theme.palette.accent.opacity(0.18), theme.palette.accent.opacity(0.06)],
                            startPoint: .topLeading, endPoint: .bottomTrailing
                        ))
                }

                // Adhkar grid
                LazyVGrid(
                    columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)],
                    spacing: 10
                ) {
                    ForEach(ADHKAR_COLLECTIONS) { collection in
                        Button {} label: {
                            VStack(alignment: .leading, spacing: 10) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .fill(theme.palette.accent.opacity(0.12))
                                        .frame(width: 34, height: 34)
                                    collection.icon.iconView
                                        .frame(width: 18, height: 18)
                                        .foregroundStyle(theme.palette.accent)
                                }
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(collection.name)
                                        .font(theme.scaledSerif(size: 15, italic: true))
                                        .foregroundStyle(theme.palette.txt)
                                    Text(collection.arabic)
                                        .font(.custom("Amiri-Regular", size: 13 * theme.fontScale))
                                        .foregroundStyle(theme.palette.accent)
                                    Text(collection.sub)
                                        .font(theme.scaledSans(size: 11))
                                        .foregroundStyle(theme.palette.txt3)
                                }
                                Spacer()
                                Text("\(collection.count) du\u{02BF}\u{0101}s")
                                    .font(theme.scaledSans(size: 10))
                                    .foregroundStyle(theme.palette.txt3)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(minHeight: 122)
                            .padding(14)
                        }
                        .buttonStyle(.plain)
                        .glass()
                    }
                }
            }
            .padding(.horizontal, 20).padding(.vertical, 8)
        }
    }
}

#Preview {
    AdhkarView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .environment(AppState())
}
