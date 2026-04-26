import SwiftUI

// MARK: - Star8 16-Vertex Polygon Shape

struct Star8Path: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 80
        var p = Path()

        p.move(to: CGPoint(x: 40 * s, y: 4 * s))
        p.addLine(to: CGPoint(x: 48 * s, y: 18 * s))
        p.addLine(to: CGPoint(x: 62 * s, y: 14 * s))
        p.addLine(to: CGPoint(x: 58 * s, y: 28 * s))
        p.addLine(to: CGPoint(x: 72 * s, y: 32 * s))
        p.addLine(to: CGPoint(x: 60 * s, y: 40 * s))
        p.addLine(to: CGPoint(x: 72 * s, y: 48 * s))
        p.addLine(to: CGPoint(x: 58 * s, y: 52 * s))
        p.addLine(to: CGPoint(x: 62 * s, y: 66 * s))
        p.addLine(to: CGPoint(x: 48 * s, y: 62 * s))
        p.addLine(to: CGPoint(x: 40 * s, y: 76 * s))
        p.addLine(to: CGPoint(x: 32 * s, y: 62 * s))
        p.addLine(to: CGPoint(x: 18 * s, y: 66 * s))
        p.addLine(to: CGPoint(x: 22 * s, y: 52 * s))
        p.addLine(to: CGPoint(x: 8 * s, y: 48 * s))
        p.addLine(to: CGPoint(x: 20 * s, y: 40 * s))
        p.addLine(to: CGPoint(x: 8 * s, y: 32 * s))
        p.addLine(to: CGPoint(x: 22 * s, y: 28 * s))
        p.addLine(to: CGPoint(x: 18 * s, y: 14 * s))
        p.addLine(to: CGPoint(x: 32 * s, y: 18 * s))
        p.closeSubpath()

        return p
    }
}

// MARK: - Star8 View

struct Star8: View {
    var size: CGFloat = 80
    var color: Color = .primary
    var strokeWidth: CGFloat = 1

    var body: some View {
        let innerCircleSize = size * (40 / 80)

        ZStack {
            Star8Path()
                .stroke(color.opacity(0.7), style: StrokeStyle(lineWidth: strokeWidth, lineJoin: .round))

            Circle()
                .stroke(color.opacity(0.3), lineWidth: strokeWidth)
                .frame(width: innerCircleSize, height: innerCircleSize)
        }
        .frame(width: size, height: size)
    }
}

// MARK: - Previews

#Preview("Star8 scales") {
    VStack(spacing: 24) {
        Star8(size: 80, color: Color(hex: 0xC26F47))
        Star8(size: 88, color: Color(hex: 0xC26F47), strokeWidth: 0.8)
        Star8(size: 120, color: Color(hex: 0xC26F47))
            .opacity(0.12)
        Star8(size: 320, color: Color(hex: 0xC26F47))
            .opacity(0.18)
        Star8(size: 28, color: .secondary)
        Star8(size: 36, color: .secondary)
    }
    .padding()
}

#Preview("Star8 with number overlay") {
    ZStack {
        Star8(size: 36, color: Color(hex: 0xC26F47))
        Text("7")
            .font(.caption)
            .fontWeight(.bold)
            .foregroundStyle(.primary)
    }
}
