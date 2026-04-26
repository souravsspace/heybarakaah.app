import SwiftUI

struct HeatmapView: View {
    @Environment(\.barakaahTheme) private var theme

    private let cells: [Int] = HeatmapGenerator.cells

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Last 14 weeks")
                    .font(theme.scaledSans(size: 10))
                    .foregroundStyle(theme.palette.txt3)
                Spacer()
                Text("\u{1E62}al\u{0101}h consistency")
                    .font(theme.scaledSans(size: 11))
                    .foregroundStyle(theme.palette.txt3)
            }

            VStack(spacing: 3) {
                ForEach(0..<7, id: \.self) { row in
                    HStack(spacing: 3) {
                        ForEach(0..<14, id: \.self) { col in
                            RoundedRectangle(cornerRadius: 3, style: .continuous)
                                .fill(color(for: cells[row * 14 + col]))
                                .aspectRatio(1, contentMode: .fit)
                        }
                    }
                }
            }

            HStack(spacing: 4) {
                Text("less").font(.caption2).foregroundStyle(theme.palette.txt4)
                ForEach(0..<5) { level in
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .fill(color(for: level))
                        .frame(width: 12, height: 12)
                }
                Text("more").font(.caption2).foregroundStyle(theme.palette.txt4)
            }
        }
    }

    private func color(for level: Int) -> Color {
        switch level {
        case 0:  return theme.palette.lineStrong
        case 1:  return theme.palette.accent.opacity(0.22)
        case 2:  return theme.palette.accent.opacity(0.45)
        case 3:  return theme.palette.accent.opacity(0.70)
        default: return theme.palette.accent
        }
    }
}

#Preview {
    HeatmapView()
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .padding()
}
