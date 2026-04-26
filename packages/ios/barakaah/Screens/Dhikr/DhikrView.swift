import SwiftUI

struct DhikrView: View {
    @Environment(\.barakaahTheme) private var theme
    @Bindable var state: AppState
    @State private var tapScale = false

    var body: some View {
        let dhikr = state.dhikr
        let progress = min(Double(state.dhikrCount) / Double(dhikr.target), 1.0)
        
        VStack(spacing: 0) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    EyebrowText(text: "Tasbīḥ")
                    Text("Dhikr")
                        .font(theme.scaledSerif(size: 24, weight: .light, italic: true))
                        .foregroundStyle(theme.palette.txt)
                }
                Spacer()
                Button("Reset") { state.dhikrCount = 0 }
                    .font(theme.scaledSans(size: 12, weight: .medium))
                    .foregroundStyle(theme.palette.txt2)
                    .padding(.horizontal, 14).padding(.vertical, 7)
                    .glass()
            }
            .padding(.horizontal, 20)
            
            // Pill selector
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Array(DHIKR_LIST.enumerated()), id: \.element.id) { idx, d in
                        Button {
                            state.dhikrIndex = idx
                            state.dhikrCount = 0
                        } label: {
                            Text(d.translit)
                                .font(theme.scaledSerif(size: 13, italic: true))
                                .foregroundStyle(state.dhikrIndex == idx ? .white : theme.palette.txt2)
                                .padding(.horizontal, 16).padding(.vertical, 8)
                                .background {
                                    Capsule()
                                        .fill(state.dhikrIndex == idx ? theme.palette.accent : theme.palette.glassBg)
                                }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 12)
            
            Spacer()
            
            // Center content
            VStack(spacing: 12) {
                EyebrowText(text: dhikr.meaning, accent: true)
                
                Text(dhikr.arabic)
                    .font(.custom("Amiri-Regular", size: 32 * theme.fontScale))
                    .foregroundStyle(theme.palette.txt)
                    .lineSpacing(32 * theme.fontScale * 0.5)
                    .multilineTextAlignment(.center)
                
                Text(dhikr.translit)
                    .font(theme.scaledSerif(size: 13, italic: true))
                    .foregroundStyle(theme.palette.txt3)
                
                // Misbaha bead ring
                Button {
                    guard state.dhikrCount < dhikr.target else { return }
                    state.dhikrCount += 1
                    tapScale = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.24) {
                        tapScale = false
                    }
                } label: {
                    ZStack {
                        // Progress ring
                        Circle()
                            .stroke(theme.palette.lineStrong, lineWidth: 1)
                            .frame(width: 280, height: 280)
                        
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(theme.palette.accent, style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                            .frame(width: 280, height: 280)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut(duration: 0.4), value: state.dhikrCount)
                        
                        // Center disk
                        VStack(spacing: 2) {
                            Text("\(state.dhikrCount)")
                                .font(theme.scaledSerif(size: 64, weight: .light))
                                .foregroundStyle(theme.palette.txt)
                            Text("of \(dhikr.target)")
                                .font(theme.scaledSerif(size: 14, italic: true))
                                .foregroundStyle(theme.palette.txt3)
                        }
                        .frame(width: 160, height: 160)
                        .background(.ultraThinMaterial, in: Circle())
                    }
                }
                .buttonStyle(.plain)
                .scaleEffect(tapScale ? 0.96 : 1.0)
                .animation(.spring(response: 0.12), value: tapScale)
                
                Text(state.dhikrCount >= dhikr.target ? "Mā shāʾ Allāh — completed." : "Tap anywhere on the misbaha")
                    .font(theme.scaledSans(size: 12))
                    .foregroundStyle(theme.palette.txt3)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    DhikrView(state: AppState())
        .environment(\.barakaahTheme, BarakaahTheme.default)
}
