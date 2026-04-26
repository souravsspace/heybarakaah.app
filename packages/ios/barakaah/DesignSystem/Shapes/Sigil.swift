import SwiftUI

struct Sigil: View {
    var size: CGFloat = 60
    var strokeWidth: CGFloat = 1
    var color: Color = .primary

    var body: some View {
        let s = size / 60

        ZStack {
            Circle()
                .stroke(color.opacity(0.4), lineWidth: strokeWidth)
                .frame(width: 44 * s, height: 44 * s)

            Circle()
                .stroke(color.opacity(0.6), lineWidth: strokeWidth)
                .frame(width: 28 * s, height: 28 * s)

            // Vertical diamond
            Path { p in
                p.move(to: CGPoint(x: 30 * s, y: 8 * s))
                p.addLine(to: CGPoint(x: 38 * s, y: 30 * s))
                p.addLine(to: CGPoint(x: 30 * s, y: 52 * s))
                p.addLine(to: CGPoint(x: 22 * s, y: 30 * s))
                p.closeSubpath()
            }
            .stroke(color, lineWidth: strokeWidth)

            // Horizontal diamond
            Path { p in
                p.move(to: CGPoint(x: 8 * s, y: 30 * s))
                p.addLine(to: CGPoint(x: 30 * s, y: 22 * s))
                p.addLine(to: CGPoint(x: 52 * s, y: 30 * s))
                p.addLine(to: CGPoint(x: 30 * s, y: 38 * s))
                p.closeSubpath()
            }
            .stroke(color.opacity(0.7), lineWidth: strokeWidth)

            // Center dot
            Circle()
                .fill(color.opacity(0.5))
                .frame(width: 6 * s, height: 6 * s)
        }
        .accessibilityHidden(true)
        .frame(width: size, height: size)
    }
}

#Preview {
    VStack(spacing: 20) {
        Sigil(size: 60, color: .primary)
        Sigil(size: 88, strokeWidth: 0.7, color: Color(hex: 0xC26F47))
        Sigil(size: 150, strokeWidth: 0.5, color: Color(hex: 0xC26F47))
            .opacity(0.10)
    }
    .padding()
}
