import SwiftUI

struct ProgressBars: View {
    @Environment(\.barakaahTheme) private var theme
    
    let step: Int
    let total: Int

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<total, id: \.self) { i in
                Capsule()
                    .fill(i <= step ? theme.palette.accent : theme.palette.lineStrong)
                    .frame(height: 2)
                    .animation(.easeInOut(duration: 0.3), value: step)
            }
        }
    }
}

#Preview {
    ProgressBars(step: 3, total: 9)
        .environment(\.barakaahTheme, BarakaahTheme.default)
        .padding()
}
