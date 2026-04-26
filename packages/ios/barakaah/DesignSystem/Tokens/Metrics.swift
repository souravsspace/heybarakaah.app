import SwiftUI

// MARK: - Radius Tokens

enum BarakaahRadius {
    static let r: CGFloat = 22
    static let sm: CGFloat = 14
    static let lg: CGFloat = 28
    static let phone: CGFloat = 46
    static let range: ClosedRange<CGFloat> = 10...32
}

// MARK: - Blur Tokens

enum BarakaahBlur {
    static let `default`: CGFloat = 28
    static let sat: CGFloat = 1.8
    static let range: ClosedRange<CGFloat> = 6...48
}

// MARK: - Spacing Tokens

enum BarakaahPad {
    static let page: CGFloat = 20
    static let card: CGFloat = 18
    static let ob: CGFloat = 24
    static let welcome: CGFloat = 28
    static let ayahH: CGFloat = 18
    static let ayahV: CGFloat = 22
    static let compactH: CGFloat = 14
    static let compactV: CGFloat = 16
    static let sectionGap: CGFloat = 12
    static let buttonGap: CGFloat = 8
    static let heroGapMin: CGFloat = 10
    static let heroGapMax: CGFloat = 14
}

// MARK: - Border Widths

enum BarakaahBorder {
    static let hair: CGFloat = 0.5
    static let thin: CGFloat = 1
    static let medium: CGFloat = 1.5
}

// MARK: - Glass Shadow

struct GlassShadow {
    let insetTop: Color
    let insetOffset: CGPoint
    let drop: Color
    let dropRadius: CGFloat
    let dropY: CGFloat
    
    static func make(theme: Theme) -> GlassShadow {
        switch theme {
        case .light:
            GlassShadow(
                insetTop: Color(hex: 0xFFFFFF, alpha: 0.55),
                insetOffset: CGPoint(x: 0, y: 1),
                drop: Color(hex: 0x2E2622, alpha: 0.10),
                dropRadius: 32,
                dropY: 8
            )
        case .dark, .sepia:
            GlassShadow(
                insetTop: Color(hex: 0xFFFFFF, alpha: 0.06),
                insetOffset: CGPoint(x: 0, y: 1),
                drop: Color(hex: 0x000000, alpha: 0.45),
                dropRadius: 32,
                dropY: 8
            )
        }
    }
}

// MARK: - Tab Bar Shadow

struct TabBarShadow {
    let drop: Color
    let dropRadius: CGFloat
    let dropY: CGFloat
    
    static func make(theme: Theme) -> TabBarShadow {
        switch theme {
        case .light:
            TabBarShadow(
                drop: Color(hex: 0x2E2622, alpha: 0.18),
                dropRadius: 28,
                dropY: 12
            )
        case .dark, .sepia:
            TabBarShadow(
                drop: Color(hex: 0x000000, alpha: 0.45),
                dropRadius: 28,
                dropY: 12
            )
        }
    }
}

// MARK: - Device Shadow

enum DeviceShadow {
    static let drop = Color(hex: 0x000000, alpha: 0.45)
    static let dropRadius: CGFloat = 100
    static let dropY: CGFloat = 50
    static let insetColor1 = Color(hex: 0xFFFFFF, alpha: 0.04)
    static let insetColor2 = Color(hex: 0x1A1A1A)
}

// MARK: - Glass Shadow View Modifier

struct GlassShadowModifier: ViewModifier {
    let theme: Theme
    
    func body(content: Content) -> some View {
        let shadow = GlassShadow.make(theme: theme)
        content
            .shadow(
                color: shadow.drop,
                radius: shadow.dropRadius,
                y: shadow.dropY
            )
    }
}

extension View {
    func glassShadow(theme: Theme) -> some View {
        modifier(GlassShadowModifier(theme: theme))
    }
}
