import SwiftUI

// MARK: - Barakaah Icon Set
/// 27 custom stroked icons ported from the HTML prototype's icons.jsx.
/// All icons use a 24×24 viewBox, stroke `currentColor`, round caps/joins.
/// Apply `.foregroundStyle(...)` to color them.

// MARK: - Home
struct IconHome: View {
    var body: some View { HomePath().stroke(style: .roundStroke) }
}
fileprivate struct HomePath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24
        var p = Path()
        p.move(to: CGPoint(x: 3 * s, y: 11.5 * s))
        p.addLine(to: CGPoint(x: 12 * s, y: 4 * s))
        p.addLine(to: CGPoint(x: 21 * s, y: 11.5 * s)); p.addLine(to: CGPoint(x: 21 * s, y: 20 * s))
        p.addLine(to: CGPoint(x: 16 * s, y: 20 * s)); p.addLine(to: CGPoint(x: 16 * s, y: 13 * s))
        p.addLine(to: CGPoint(x: 8 * s, y: 13 * s)); p.addLine(to: CGPoint(x: 8 * s, y: 20 * s))
        p.addLine(to: CGPoint(x: 3 * s, y: 20 * s)); p.closeSubpath()
        return p
    }
}

// MARK: - Salah
struct IconSalah: View {
    var body: some View {
        ZStack {
            CirclePath(r: 9).stroke(style: .roundStroke)
            SalahHandPath().stroke(style: .roundStroke)
        }
    }
}
fileprivate struct CirclePath: Shape {
    let r: CGFloat
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24
        return Path(ellipseIn: CGRect(x: (12 - r) * s, y: (12 - r) * s, width: 2 * r * s, height: 2 * r * s))
    }
}
fileprivate struct SalahHandPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24
        var p = Path()
        p.move(to: CGPoint(x: 12 * s, y: 3 * s))
        p.addLine(to: CGPoint(x: 12 * s, y: 12 * s))
        p.addLine(to: CGPoint(x: 17 * s, y: 15 * s))
        return p
    }
}

// MARK: - Quran
struct IconQuran: View {
    var body: some View {
        ZStack {
            QuranCoverPath().stroke(style: .roundStroke)
            QuranPagePath().stroke(style: .roundStroke)
        }
    }
}
fileprivate struct QuranCoverPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24
        var p = Path()
        p.move(to: CGPoint(x: 4 * s, y: 4 * s))
        p.addLine(to: CGPoint(x: 16 * s, y: 4 * s))
        p.addCurve(to: CGPoint(x: 19 * s, y: 7 * s),
                   control1: CGPoint(x: 17.66 * s, y: 4 * s),
                   control2: CGPoint(x: 19 * s, y: 5.34 * s))
        p.addLine(to: CGPoint(x: 19 * s, y: 20 * s))
        p.addLine(to: CGPoint(x: 7 * s, y: 20 * s))
        p.addCurve(to: CGPoint(x: 4 * s, y: 17 * s),
                   control1: CGPoint(x: 5.34 * s, y: 20 * s),
                   control2: CGPoint(x: 4 * s, y: 18.66 * s))
        p.closeSubpath()
        return p
    }
}
fileprivate struct QuranPagePath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24
        var p = Path()
        p.move(to: CGPoint(x: 4 * s, y: 17 * s))
        p.addCurve(to: CGPoint(x: 7 * s, y: 14 * s),
                   control1: CGPoint(x: 4 * s, y: 15.34 * s),
                   control2: CGPoint(x: 5.34 * s, y: 14 * s))
        p.addLine(to: CGPoint(x: 19 * s, y: 14 * s))
        return p
    }
}

// MARK: - Tasbih
struct IconTasbih: View {
    var body: some View {
        ZStack {
            CirclePath(r: 3).stroke(style: .roundStroke)
            ForEach(Array(tasbihDots.enumerated()), id: \.offset) { dot in
                CirclePath(r: 1.4).stroke(style: .roundStroke)
                    .offset(x: dot.x, y: dot.y)
            }
        }
    }
    private var tasbihDots: [(x: CGFloat, y: CGFloat)] {
        let r: CGFloat = 8
        return (0..<8).map { i in
            let angle = Double(i) * .pi / 4
            return (x: r * cos(angle), y: r * sin(angle))
        }
    }
}

// MARK: - User
struct IconUser: View {
    var body: some View {
        ZStack {
            CirclePath(r: 4).stroke(style: .roundStroke) // head at cx:12, cy:8
                .offset(y: -4)
            UserBodyPath().stroke(style: .roundStroke)
        }
    }
}
fileprivate struct UserBodyPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24
        var p = Path()
        p.move(to: CGPoint(x: 3 * s, y: 21 * s))
        p.addCurve(to: CGPoint(x: 21 * s, y: 21 * s),
                   control1: CGPoint(x: 7.5 * s, y: 16.5 * s),
                   control2: CGPoint(x: 16.5 * s, y: 16.5 * s))
        return p
    }
}

// MARK: - Settings
struct IconSettings: View {
    var body: some View {
        ZStack {
            CirclePath(r: 2.5).stroke(style: .roundStroke)
            SettingsGearPath().stroke(style: .roundStroke)
        }
    }
}
fileprivate struct SettingsGearPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 19.4 * s, y: 15 * s))
        p.addCurve(to: CGPoint(x: 19.73 * s, y: 16.82 * s),
                   control1: CGPoint(x: 19.4 * s, y: 15.66 * s),
                   control2: CGPoint(x: 19.51 * s, y: 16.27 * s))
        p.addLine(to: CGPoint(x: 19.79 * s, y: 16.88 * s))
        p.addCurve(to: CGPoint(x: 16.88 * s, y: 19.79 * s),
                   control1: CGPoint(x: 19.79 * s, y: 18.88 * s),
                   control2: CGPoint(x: 18.88 * s, y: 19.79 * s))
        p.addCurve(to: CGPoint(x: 13.97 * s, y: 16.88 * s),
                   control1: CGPoint(x: 14.88 * s, y: 19.79 * s),
                   control2: CGPoint(x: 13.97 * s, y: 18.88 * s))
        p.addLine(to: CGPoint(x: 13.91 * s, y: 16.82 * s))
        p.addCurve(to: CGPoint(x: 12.09 * s, y: 16.49 * s),
                   control1: CGPoint(x: 13.36 * s, y: 16.82 * s),
                   control2: CGPoint(x: 12.75 * s, y: 16.49 * s))
        p.addCurve(to: CGPoint(x: 10.27 * s, y: 15.49 * s),
                   control1: CGPoint(x: 11.43 * s, y: 16.49 * s),
                   control2: CGPoint(x: 10.82 * s, y: 16.16 * s))
        p.addLine(to: CGPoint(x: 10.21 * s, y: 15.43 * s))
        p.addCurve(to: CGPoint(x: 10.54 * s, y: 13.61 * s),
                   control1: CGPoint(x: 10.21 * s, y: 14.77 * s),
                   control2: CGPoint(x: 10.54 * s, y: 14.27 * s))
        p.addCurve(to: CGPoint(x: 9.54 * s, y: 11.79 * s),
                   control1: CGPoint(x: 10.54 * s, y: 12.95 * s),
                   control2: CGPoint(x: 9.87 * s, y: 12.34 * s))
        p.addLine(to: CGPoint(x: 9.48 * s, y: 11.73 * s))
        p.addCurve(to: CGPoint(x: 10.09 * s, y: 8.82 * s),
                   control1: CGPoint(x: 8.82 * s, y: 10.73 * s),
                   control2: CGPoint(x: 9.09 * s, y: 9.82 * s))
        p.addCurve(to: CGPoint(x: 13.0 * s, y: 9.49 * s),
                   control1: CGPoint(x: 11.09 * s, y: 7.82 * s),
                   control2: CGPoint(x: 13.0 * s, y: 8.49 * s))
        p.addLine(to: CGPoint(x: 13.06 * s, y: 9.43 * s))
        p.addCurve(to: CGPoint(x: 15.88 * s, y: 9.1 * s),
                   control1: CGPoint(x: 13.72 * s, y: 9.43 * s),
                   control2: CGPoint(x: 14.33 * s, y: 9.1 * s))
        p.addCurve(to: CGPoint(x: 17.7 * s, y: 9.1 * s),
                   control1: CGPoint(x: 16.54 * s, y: 9.1 * s),
                   control2: CGPoint(x: 17.15 * s, y: 9.43 * s))
        p.addLine(to: CGPoint(x: 17.76 * s, y: 9.04 * s))
        p.addCurve(to: CGPoint(x: 18.28 * s, y: 7.22 * s),
                   control1: CGPoint(x: 18.08 * s, y: 8.49 * s),
                   control2: CGPoint(x: 18.08 * s, y: 7.88 * s))
        p.addLine(to: CGPoint(x: 18.34 * s, y: 7.16 * s))
        p.addCurve(to: CGPoint(x: 20.25 * s, y: 8.54 * s),
                   control1: CGPoint(x: 18.88 * s, y: 7.16 * s),
                   control2: CGPoint(x: 19.76 * s, y: 7.64 * s))
        p.addCurve(to: CGPoint(x: 20.83 * s, y: 11.45 * s),
                   control1: CGPoint(x: 21.25 * s, y: 9.54 * s),
                   control2: CGPoint(x: 21.83 * s, y: 10.45 * s))
        p.addCurve(to: CGPoint(x: 17.92 * s, y: 12.06 * s),
                   control1: CGPoint(x: 19.83 * s, y: 12.45 * s),
                   control2: CGPoint(x: 18.92 * s, y: 13.06 * s))
        p.addLine(to: CGPoint(x: 17.86 * s, y: 12.12 * s))
        p.addCurve(to: CGPoint(x: 17.53 * s, y: 13.94 * s),
                   control1: CGPoint(x: 17.86 * s, y: 12.78 * s),
                   control2: CGPoint(x: 17.53 * s, y: 13.28 * s))
        p.addCurve(to: CGPoint(x: 18.53 * s, y: 15.76 * s),
                   control1: CGPoint(x: 17.53 * s, y: 14.6 * s),
                   control2: CGPoint(x: 18.2 * s, y: 15.21 * s))
        p.closeSubpath()
        return p
    }
}

// MARK: - Bookmark
struct IconBookmark: View {
    var body: some View { BookmarkPath().stroke(style: .roundStroke) }
}
fileprivate struct BookmarkPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 19 * s, y: 21 * s))
        p.addLine(to: CGPoint(x: 12 * s, y: 16 * s))
        p.addLine(to: CGPoint(x: 5 * s, y: 21 * s))
        p.addLine(to: CGPoint(x: 5 * s, y: 5 * s))
        p.addCurve(to: CGPoint(x: 7 * s, y: 3 * s),
                   control1: CGPoint(x: 5 * s, y: 3.9 * s),
                   control2: CGPoint(x: 5.9 * s, y: 3 * s))
        p.addLine(to: CGPoint(x: 17 * s, y: 3 * s))
        p.addCurve(to: CGPoint(x: 19 * s, y: 5 * s),
                   control1: CGPoint(x: 18.1 * s, y: 3 * s),
                   control2: CGPoint(x: 19 * s, y: 3.9 * s))
        p.closeSubpath()
        return p
    }
}

// MARK: - Share
struct IconShare: View {
    var body: some View { SharePath().stroke(style: .roundStroke) }
}
fileprivate struct SharePath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 12 * s, y: 3 * s)); p.addLine(to: CGPoint(x: 12 * s, y: 16 * s))
        p.move(to: CGPoint(x: 7 * s, y: 8 * s)); p.addLine(to: CGPoint(x: 12 * s, y: 3 * s))
        p.addLine(to: CGPoint(x: 17 * s, y: 8 * s))
        p.move(to: CGPoint(x: 5 * s, y: 21 * s)); p.addLine(to: CGPoint(x: 19 * s, y: 21 * s))
        return p
    }
}

// MARK: - Refresh
struct IconRefresh: View {
    var body: some View { RefreshPath().stroke(style: .roundStroke) }
}
fileprivate struct RefreshPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.addArc(center: CGPoint(x: 12 * s, y: 12 * s), radius: 9 * s, startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true)
        p.addLine(to: CGPoint(x: 21 * s, y: 4 * s))
        p.move(to: CGPoint(x: 21 * s, y: 4 * s))
        p.addLine(to: CGPoint(x: 21 * s, y: 9 * s))
        p.addLine(to: CGPoint(x: 16 * s, y: 4 * s))
        return p
    }
}

// MARK: - ChevronRight / ChevronLeft
struct IconChevronRight: View {
    var body: some View { ChevronRightPath().stroke(style: .roundStroke) }
}
fileprivate struct ChevronRightPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 9 * s, y: 6 * s))
        p.addLine(to: CGPoint(x: 15 * s, y: 12 * s))
        p.addLine(to: CGPoint(x: 9 * s, y: 18 * s))
        return p
    }
}
struct IconChevronLeft: View {
    var body: some View { ChevronLeftPath().stroke(style: .roundStroke) }
}
fileprivate struct ChevronLeftPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 15 * s, y: 6 * s))
        p.addLine(to: CGPoint(x: 9 * s, y: 12 * s))
        p.addLine(to: CGPoint(x: 15 * s, y: 18 * s))
        return p
    }
}

// MARK: - Check / Plus / Close
struct IconCheck: View {
    var body: some View { CheckPath().stroke(style: .roundStroke) }
}
fileprivate struct CheckPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 5 * s, y: 12 * s))
        p.addLine(to: CGPoint(x: 10 * s, y: 17 * s))
        p.addLine(to: CGPoint(x: 20 * s, y: 7 * s))
        return p
    }
}
struct IconPlus: View {
    var body: some View { PlusPath().stroke(style: .roundStroke) }
}
fileprivate struct PlusPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 12 * s, y: 5 * s)); p.addLine(to: CGPoint(x: 12 * s, y: 19 * s))
        p.move(to: CGPoint(x: 5 * s, y: 12 * s)); p.addLine(to: CGPoint(x: 19 * s, y: 12 * s))
        return p
    }
}
struct IconClose: View {
    var body: some View { ClosePath().stroke(style: .roundStroke) }
}
fileprivate struct ClosePath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 6 * s, y: 6 * s)); p.addLine(to: CGPoint(x: 18 * s, y: 18 * s))
        p.move(to: CGPoint(x: 18 * s, y: 6 * s)); p.addLine(to: CGPoint(x: 6 * s, y: 18 * s))
        return p
    }
}

// MARK: - Location
struct IconLocation: View {
    var body: some View {
        ZStack {
            LocationPath().stroke(style: .roundStroke)
            CirclePath(r: 3).stroke(style: .roundStroke).offset(y: -2)
        }
    }
}
fileprivate struct LocationPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 21 * s, y: 10 * s))
        p.addCurve(to: CGPoint(x: 3 * s, y: 10 * s),
                   control1: CGPoint(x: 21 * s, y: 5.03 * s),
                   control2: CGPoint(x: 3 * s, y: 5.03 * s))
        p.addCurve(to: CGPoint(x: 12 * s, y: 23 * s),
                   control1: CGPoint(x: 3 * s, y: 14.97 * s),
                   control2: CGPoint(x: 12 * s, y: 23 * s))
        p.addCurve(to: CGPoint(x: 21 * s, y: 10 * s),
                   control1: CGPoint(x: 12 * s, y: 23 * s),
                   control2: CGPoint(x: 21 * s, y: 14.97 * s))
        p.closeSubpath()
        return p
    }
}

// MARK: - Bell
struct IconBell: View {
    var body: some View { BellPath().stroke(style: .roundStroke) }
}
fileprivate struct BellPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 18 * s, y: 8 * s))
        p.addCurve(to: CGPoint(x: 6 * s, y: 8 * s),
                   control1: CGPoint(x: 18 * s, y: 4.69 * s),
                   control2: CGPoint(x: 6 * s, y: 4.69 * s))
        p.addCurve(to: CGPoint(x: 3 * s, y: 17 * s),
                   control1: CGPoint(x: 6 * s, y: 11.31 * s),
                   control2: CGPoint(x: 3 * s, y: 17 * s))
        p.addLine(to: CGPoint(x: 21 * s, y: 17 * s))
        p.addCurve(to: CGPoint(x: 18 * s, y: 8 * s),
                   control1: CGPoint(x: 21 * s, y: 17 * s),
                   control2: CGPoint(x: 18 * s, y: 11.31 * s))
        p.move(to: CGPoint(x: 13.7 * s, y: 21 * s))
        p.addCurve(to: CGPoint(x: 10.3 * s, y: 21 * s),
                   control1: CGPoint(x: 13.7 * s, y: 21.76 * s),
                   control2: CGPoint(x: 10.3 * s, y: 21.76 * s))
        return p
    }
}

// MARK: - Moon / Sun
struct IconMoon: View {
    var body: some View { MoonPath().stroke(style: .roundStroke) }
}
fileprivate struct MoonPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 21 * s, y: 12.8 * s))
        p.addCurve(to: CGPoint(x: 11.2 * s, y: 3 * s),
                   control1: CGPoint(x: 17.36 * s, y: 7.44 * s),
                   control2: CGPoint(x: 11.2 * s, y: 3 * s))
        p.addCurve(to: CGPoint(x: 21 * s, y: 12.8 * s),
                   control1: CGPoint(x: 16.56 * s, y: 3 * s),
                   control2: CGPoint(x: 21 * s, y: 7.44 * s))
        return p
    }
}
struct IconSun: View {
    var body: some View {
        ZStack {
            CirclePath(r: 4).stroke(style: .roundStroke)
            SunRaysPath().stroke(style: .roundStroke)
        }
    }
}
fileprivate struct SunRaysPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 12 * s, y: 2 * s)); p.addLine(to: CGPoint(x: 12 * s, y: 4 * s))
        p.move(to: CGPoint(x: 12 * s, y: 20 * s)); p.addLine(to: CGPoint(x: 12 * s, y: 22 * s))
        p.move(to: CGPoint(x: 2 * s, y: 12 * s)); p.addLine(to: CGPoint(x: 4 * s, y: 12 * s))
        p.move(to: CGPoint(x: 20 * s, y: 12 * s)); p.addLine(to: CGPoint(x: 22 * s, y: 12 * s))
        p.move(to: CGPoint(x: 4.93 * s, y: 4.93 * s)); p.addLine(to: CGPoint(x: 6.34 * s, y: 6.34 * s))
        p.move(to: CGPoint(x: 17.66 * s, y: 17.66 * s)); p.addLine(to: CGPoint(x: 19.07 * s, y: 19.07 * s))
        p.move(to: CGPoint(x: 4.93 * s, y: 19.07 * s)); p.addLine(to: CGPoint(x: 6.34 * s, y: 17.66 * s))
        p.move(to: CGPoint(x: 17.66 * s, y: 6.34 * s)); p.addLine(to: CGPoint(x: 19.07 * s, y: 4.93 * s))
        return p
    }
}

// MARK: - Star
struct IconStar: View {
    var body: some View { StarPath().stroke(style: .roundStroke) }
}
fileprivate struct StarPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 12 * s, y: 2 * s))
        p.addLine(to: CGPoint(x: 15 * s, y: 9 * s))
        p.addLine(to: CGPoint(x: 22 * s, y: 9 * s))
        p.addLine(to: CGPoint(x: 16.5 * s, y: 13.5 * s))
        p.addLine(to: CGPoint(x: 18 * s, y: 21 * s))
        p.addLine(to: CGPoint(x: 12 * s, y: 17 * s))
        p.addLine(to: CGPoint(x: 6 * s, y: 21 * s))
        p.addLine(to: CGPoint(x: 7.5 * s, y: 13.5 * s))
        p.addLine(to: CGPoint(x: 2 * s, y: 9 * s))
        p.addLine(to: CGPoint(x: 9 * s, y: 9 * s))
        p.closeSubpath()
        return p
    }
}

// MARK: - Leaf
struct IconLeaf: View {
    var body: some View { LeafPath().stroke(style: .roundStroke) }
}
fileprivate struct LeafPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 11 * s, y: 20 * s))
        p.addCurve(to: CGPoint(x: 4 * s, y: 13 * s),
                   control1: CGPoint(x: 11 * s, y: 18 * s),
                   control2: CGPoint(x: 4 * s, y: 16.87 * s))
        p.addCurve(to: CGPoint(x: 21 * s, y: 2 * s),
                   control1: CGPoint(x: 4 * s, y: 6.13 * s),
                   control2: CGPoint(x: 14 * s, y: 2 * s))
        p.addCurve(to: CGPoint(x: 11 * s, y: 20 * s),
                   control1: CGPoint(x: 21 * s, y: 9 * s),
                   control2: CGPoint(x: 18 * s, y: 19 * s))
        p.addCurve(to: CGPoint(x: 6 * s, y: 15 * s),
                   control1: CGPoint(x: 8 * s, y: 20.5 * s),
                   control2: CGPoint(x: 6 * s, y: 17 * s))
        p.move(to: CGPoint(x: 2 * s, y: 22 * s)); p.addLine(to: CGPoint(x: 10 * s, y: 14 * s))
        return p
    }
}

// MARK: - Compass
struct IconCompass: View {
    var body: some View {
        ZStack {
            CirclePath(r: 9).stroke(style: .roundStroke)
            CompassNeedlePath().stroke(style: .roundStroke)
        }
    }
}
fileprivate struct CompassNeedlePath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 16.24 * s, y: 7.76 * s))
        p.addLine(to: CGPoint(x: 14.12 * s, y: 14.12 * s))
        p.addLine(to: CGPoint(x: 7.76 * s, y: 16.24 * s))
        p.addLine(to: CGPoint(x: 9.88 * s, y: 9.88 * s))
        p.closeSubpath()
        return p
    }
}

// MARK: - Lock
struct IconLock: View {
    var body: some View {
        ZStack {
            LockBodyPath().stroke(style: .roundStroke)
            LockShacklePath().stroke(style: .roundStroke)
        }
    }
}
fileprivate struct LockBodyPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24
        return Path(roundedRect: CGRect(x: 5 * s, y: 11 * s, width: 14 * s, height: 10 * s), cornerRadius: 2 * s)
    }
}
fileprivate struct LockShacklePath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 8 * s, y: 11 * s))
        p.addLine(to: CGPoint(x: 8 * s, y: 7 * s))
        p.addCurve(to: CGPoint(x: 16 * s, y: 7 * s),
                   control1: CGPoint(x: 8 * s, y: 4.79 * s),
                   control2: CGPoint(x: 16 * s, y: 4.79 * s))
        p.addLine(to: CGPoint(x: 16 * s, y: 11 * s))
        return p
    }
}

// MARK: - Heart
struct IconHeart: View {
    var body: some View { HeartPath().stroke(style: .roundStroke) }
}
fileprivate struct HeartPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 20.84 * s, y: 4.61 * s))
        p.addCurve(to: CGPoint(x: 13.06 * s, y: 4.61 * s),
                   control1: CGPoint(x: 18.69 * s, y: 2.46 * s),
                   control2: CGPoint(x: 15.21 * s, y: 2.46 * s))
        p.addLine(to: CGPoint(x: 12 * s, y: 5.67 * s))
        p.addLine(to: CGPoint(x: 10.94 * s, y: 4.61 * s))
        p.addCurve(to: CGPoint(x: 3.16 * s, y: 4.61 * s),
                   control1: CGPoint(x: 8.79 * s, y: 2.46 * s),
                   control2: CGPoint(x: 5.31 * s, y: 2.46 * s))
        p.addCurve(to: CGPoint(x: 3.16 * s, y: 12.39 * s),
                   control1: CGPoint(x: 1.01 * s, y: 6.76 * s),
                   control2: CGPoint(x: 1.01 * s, y: 10.24 * s))
        p.addLine(to: CGPoint(x: 12 * s, y: 21 * s))
        p.addLine(to: CGPoint(x: 20.84 * s, y: 12.39 * s))
        p.addCurve(to: CGPoint(x: 20.84 * s, y: 4.61 * s),
                   control1: CGPoint(x: 22.99 * s, y: 10.24 * s),
                   control2: CGPoint(x: 22.99 * s, y: 6.76 * s))
        return p
    }
}

// MARK: - Calendar
struct IconCalendar: View {
    var body: some View {
        ZStack {
            CalendarBodyPath().stroke(style: .roundStroke)
            CalendarLinesPath().stroke(style: .roundStroke)
        }
    }
}
fileprivate struct CalendarBodyPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24
        return Path(roundedRect: CGRect(x: 3 * s, y: 5 * s, width: 18 * s, height: 16 * s), cornerRadius: 2 * s)
    }
}
fileprivate struct CalendarLinesPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 16 * s, y: 3 * s)); p.addLine(to: CGPoint(x: 16 * s, y: 7 * s))
        p.move(to: CGPoint(x: 8 * s, y: 3 * s)); p.addLine(to: CGPoint(x: 8 * s, y: 7 * s))
        p.move(to: CGPoint(x: 3 * s, y: 11 * s)); p.addLine(to: CGPoint(x: 21 * s, y: 11 * s))
        return p
    }
}

// MARK: - Flame
struct IconFlame: View {
    var body: some View { FlamePath().stroke(style: .roundStroke) }
}
fileprivate struct FlamePath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 12 * s, y: 2 * s))
        p.addCurve(to: CGPoint(x: 17 * s, y: 11 * s),
                   control1: CGPoint(x: 16 * s, y: 4 * s),
                   control2: CGPoint(x: 17 * s, y: 7 * s))
        p.addCurve(to: CGPoint(x: 7 * s, y: 11 * s),
                   control1: CGPoint(x: 17 * s, y: 13.76 * s),
                   control2: CGPoint(x: 7 * s, y: 13.76 * s))
        p.addCurve(to: CGPoint(x: 12 * s, y: 2 * s),
                   control1: CGPoint(x: 7 * s, y: 8.24 * s),
                   control2: CGPoint(x: 8 * s, y: 2 * s))
        return p
    }
}

// MARK: - ArrowRight
struct IconArrowRight: View {
    var body: some View { ArrowRightPath().stroke(style: .roundStroke) }
}
fileprivate struct ArrowRightPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 5 * s, y: 12 * s)); p.addLine(to: CGPoint(x: 19 * s, y: 12 * s))
        p.move(to: CGPoint(x: 13 * s, y: 6 * s)); p.addLine(to: CGPoint(x: 19 * s, y: 12 * s))
        p.addLine(to: CGPoint(x: 13 * s, y: 18 * s))
        return p
    }
}

// MARK: - Search
struct IconSearch: View {
    var body: some View { SearchPath().stroke(style: .roundStroke) }
}
fileprivate struct SearchPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.addEllipse(in: CGRect(x: 4 * s, y: 4 * s, width: 14 * s, height: 14 * s))
        p.move(to: CGPoint(x: 21 * s, y: 21 * s)); p.addLine(to: CGPoint(x: 16 * s, y: 16 * s))
        return p
    }
}

// MARK: - Headphones
struct IconHeadphones: View {
    var body: some View { HeadphonesPath().stroke(style: .roundStroke) }
}
fileprivate struct HeadphonesPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 3 * s, y: 18 * s))
        p.addLine(to: CGPoint(x: 3 * s, y: 12 * s))
        p.addCurve(to: CGPoint(x: 21 * s, y: 12 * s),
                   control1: CGPoint(x: 3 * s, y: 7.03 * s),
                   control2: CGPoint(x: 21 * s, y: 7.03 * s))
        p.addLine(to: CGPoint(x: 21 * s, y: 18 * s))
        p.move(to: CGPoint(x: 21 * s, y: 19 * s))
        p.addCurve(to: CGPoint(x: 19 * s, y: 21 * s),
                   control1: CGPoint(x: 21 * s, y: 20.1 * s),
                   control2: CGPoint(x: 20.1 * s, y: 21 * s))
        p.addLine(to: CGPoint(x: 18 * s, y: 21 * s))
        p.addLine(to: CGPoint(x: 18 * s, y: 15 * s))
        p.addLine(to: CGPoint(x: 21 * s, y: 15 * s))
        p.move(to: CGPoint(x: 3 * s, y: 19 * s))
        p.addCurve(to: CGPoint(x: 5 * s, y: 21 * s),
                   control1: CGPoint(x: 3 * s, y: 20.1 * s),
                   control2: CGPoint(x: 3.9 * s, y: 21 * s))
        p.addLine(to: CGPoint(x: 6 * s, y: 21 * s))
        p.addLine(to: CGPoint(x: 6 * s, y: 15 * s))
        p.addLine(to: CGPoint(x: 3 * s, y: 15 * s))
        return p
    }
}

// MARK: - Play
struct IconPlay: View {
    var body: some View { PlayPath().fill(style: .eofill) } // uses fill, not stroke
}
fileprivate struct PlayPath: Shape {
    func path(in rect: CGRect) -> Path {
        let s = rect.width / 24; var p = Path()
        p.move(to: CGPoint(x: 5 * s, y: 3 * s))
        p.addLine(to: CGPoint(x: 19 * s, y: 12 * s))
        p.addLine(to: CGPoint(x: 5 * s, y: 21 * s))
        p.closeSubpath()
        return p
    }
}

// MARK: - Stroke Style Helper
extension StrokeStyle {
    static let roundStroke = StrokeStyle(lineCap: .round, lineJoin: .round)
}

// MARK: - Preview
#if DEBUG
struct BarakaahIconsPreview: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 16) {
                IconPreview(name: "Home", icon: IconHome())
                IconPreview(name: "Salah", icon: IconSalah())
                IconPreview(name: "Quran", icon: IconQuran())
                IconPreview(name: "Tasbih", icon: IconTasbih())
                IconPreview(name: "User", icon: IconUser())
                IconPreview(name: "Settings", icon: IconSettings())
                IconPreview(name: "Bookmark", icon: IconBookmark())
                IconPreview(name: "Share", icon: IconShare())
                IconPreview(name: "Refresh", icon: IconRefresh())
                IconPreview(name: "ChevronR", icon: IconChevronRight())
                IconPreview(name: "ChevronL", icon: IconChevronLeft())
                IconPreview(name: "Check", icon: IconCheck())
                IconPreview(name: "Plus", icon: IconPlus())
                IconPreview(name: "Close", icon: IconClose())
                IconPreview(name: "Location", icon: IconLocation())
                IconPreview(name: "Bell", icon: IconBell())
                IconPreview(name: "Moon", icon: IconMoon())
                IconPreview(name: "Sun", icon: IconSun())
                IconPreview(name: "Star", icon: IconStar())
                IconPreview(name: "Leaf", icon: IconLeaf())
                IconPreview(name: "Compass", icon: IconCompass())
                IconPreview(name: "Lock", icon: IconLock())
                IconPreview(name: "Heart", icon: IconHeart())
                IconPreview(name: "Calendar", icon: IconCalendar())
                IconPreview(name: "Flame", icon: IconFlame())
                IconPreview(name: "ArrowR", icon: IconArrowRight())
                IconPreview(name: "Search", icon: IconSearch())
                IconPreview(name: "Phones", icon: IconHeadphones())
                IconPreview(name: "Play", icon: IconPlay())
            }
            .padding()
        }
    }
}

private struct IconPreview: View {
    let name: String
    let icon: any View
    var body: some View {
        VStack(spacing: 4) {
            AnyView(icon)
                .frame(width: 24, height: 24)
                .foregroundStyle(.primary)
            Text(name).font(.caption2).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    BarakaahIconsPreview()
}
#endif
