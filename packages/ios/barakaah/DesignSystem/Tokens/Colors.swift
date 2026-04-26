import SwiftUI

// MARK: - Color Hex Initializer

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

// MARK: - Theme

enum Theme: String, CaseIterable {
    case light
    case dark
    case sepia
}

// MARK: - Accent

enum Accent: String, CaseIterable {
    case terracotta
    case emerald
    case gold
    case rose
    case blue
    
    var c1: Color {
        switch self {
        case .terracotta: Color(hex: 0xC26F47)
        case .emerald:    Color(hex: 0x3F8A6E)
        case .gold:       Color(hex: 0xC9A55C)
        case .rose:       Color(hex: 0xC26B7A)
        case .blue:       Color(hex: 0x5B7FB8)
        }
    }
    
    var c2: Color {
        switch self {
        case .terracotta: Color(hex: 0x9A4F2E)
        case .emerald:    Color(hex: 0x2A6B53)
        case .gold:       Color(hex: 0x9C7B3D)
        case .rose:       Color(hex: 0x9A4658)
        case .blue:       Color(hex: 0x3D5C8E)
        }
    }
}

// MARK: - Color Palette

struct ColorPalette {
    let bone: Color
    let bone2: Color
    let sand: Color
    let sand2: Color
    let clay: Color
    let terracotta: Color
    let terracottaDeep: Color
    let espresso: Color
    let espresso2: Color
    let ink: Color
    let ink2: Color
    let ink3: Color
    let ink4: Color
    let txt: Color
    let txt2: Color
    let txt3: Color
    let txt4: Color
    let cream: Color
    let cream2: Color
    let cream3: Color
    let cream4: Color
    let goldSoft: Color
    let sage: Color
    let sageDeep: Color
    let line: Color
    let lineStrong: Color
    let glassBg: Color
    let glassBgStrong: Color
    let glassBorder: Color
    let accent: Color
    let accent2: Color
    
    /// Legacy alias — maps to terracotta
    var gold: Color { terracotta }
}

extension ColorPalette {
    static func make(theme: Theme, accent: Accent) -> ColorPalette {
        switch theme {
        case .light: return makeLight(accent: accent)
        case .dark:  return makeDark(accent: accent)
        case .sepia: return makeSepia(accent: accent)
        }
    }
    
    // MARK: - Light Palette
    
    private static func makeLight(accent: Accent) -> ColorPalette {
        ColorPalette(
            bone:            Color(hex: 0xF5EDE0),
            bone2:           Color(hex: 0xEFE5D2),
            sand:            Color(hex: 0xE2D2B5),
            sand2:           Color(hex: 0xC8B594),
            clay:            Color(hex: 0xB8946D),
            terracotta:      Color(hex: 0xC26F47),
            terracottaDeep:  Color(hex: 0x9A4F2E),
            espresso:        Color(hex: 0x2E2622),
            espresso2:       Color(hex: 0x4A3F38),
            ink:             Color(hex: 0x1A1612),
            ink2:            Color(hex: 0x221C17),
            ink3:            Color(hex: 0x2C251F),
            ink4:            Color(hex: 0x3A3128),
            txt:             Color(hex: 0x2E2622),
            txt2:            Color(hex: 0x5C4F45),
            txt3:            Color(hex: 0x8A7A6A),
            txt4:            Color(hex: 0xB0A091),
            cream:           Color(hex: 0xF5EDE0),
            cream2:          Color(hex: 0xE8DCC4),
            cream3:          Color(hex: 0xB8AC91),
            cream4:          Color(hex: 0x8A7E68),
            goldSoft:        Color(hex: 0xD89572),
            sage:            Color(hex: 0xB8946D),
            sageDeep:        Color(hex: 0x6E5742),
            line:            Color(hex: 0x2E2622, alpha: 0.10),
            lineStrong:      Color(hex: 0x2E2622, alpha: 0.18),
            glassBg:         Color(hex: 0xF5EDE0, alpha: 0.55),
            glassBgStrong:   Color(hex: 0xF5EDE0, alpha: 0.78),
            glassBorder:     Color(hex: 0xFFFFFF, alpha: 0.55),
            accent:          accent.c1,
            accent2:         accent.c2
        )
    }
    
    // MARK: - Dark Palette
    
    private static func makeDark(accent: Accent) -> ColorPalette {
        ColorPalette(
            bone:            Color(hex: 0x1A1612),
            bone2:           Color(hex: 0x221C17),
            sand:            Color(hex: 0x2C251F),
            sand2:           Color(hex: 0x3A3128),
            clay:            Color(hex: 0xB8946D),
            terracotta:      Color(hex: 0xC26F47),
            terracottaDeep:  Color(hex: 0x9A4F2E),
            espresso:        Color(hex: 0x2E2622),
            espresso2:       Color(hex: 0x4A3F38),
            ink:             Color(hex: 0x1A1612),
            ink2:            Color(hex: 0x221C17),
            ink3:            Color(hex: 0x2C251F),
            ink4:            Color(hex: 0x3A3128),
            txt:             Color(hex: 0xF0E5D2),
            txt2:            Color(hex: 0xC9B89F),
            txt3:            Color(hex: 0x8A7A6A),
            txt4:            Color(hex: 0x5A4E43),
            cream:           Color(hex: 0xF0E5D2),
            cream2:          Color(hex: 0xD9C9AD),
            cream3:          Color(hex: 0x9C8B73),
            cream4:          Color(hex: 0x6A5C4D),
            goldSoft:        Color(hex: 0xD89572),
            sage:            Color(hex: 0xB8946D),
            sageDeep:        Color(hex: 0x6E5742),
            line:            Color(hex: 0xF0E5D2, alpha: 0.08),
            lineStrong:      Color(hex: 0xF0E5D2, alpha: 0.16),
            glassBg:         Color(hex: 0x221C17, alpha: 0.55),
            glassBgStrong:   Color(hex: 0x221C17, alpha: 0.78),
            glassBorder:     Color(hex: 0xF0E5D2, alpha: 0.10),
            accent:          accent.c1,
            accent2:         accent.c2
        )
    }
    
    // MARK: - Sepia Palette
    
    private static func makeSepia(accent: Accent) -> ColorPalette {
        ColorPalette(
            bone:            Color(hex: 0x2A201A),
            bone2:           Color(hex: 0x34281F),
            sand:            Color(hex: 0xE2D2B5),
            sand2:           Color(hex: 0xC8B594),
            clay:            Color(hex: 0xB8946D),
            terracotta:      Color(hex: 0xC26F47),
            terracottaDeep:  Color(hex: 0x9A4F2E),
            espresso:        Color(hex: 0x2E2622),
            espresso2:       Color(hex: 0x4A3F38),
            ink:             Color(hex: 0x1A1612),
            ink2:            Color(hex: 0x221C17),
            ink3:            Color(hex: 0x2C251F),
            ink4:            Color(hex: 0x3A3128),
            txt:             Color(hex: 0xF0E5D2),
            txt2:            Color(hex: 0xC9B89F),
            txt3:            Color(hex: 0x8A7A6A),
            txt4:            Color(hex: 0x5A4E43),
            cream:           Color(hex: 0xF0E5D2),
            cream2:          Color(hex: 0xD9C9AD),
            cream3:          Color(hex: 0x9C8B73),
            cream4:          Color(hex: 0x6A5C4D),
            goldSoft:        Color(hex: 0xD89572),
            sage:            Color(hex: 0xB8946D),
            sageDeep:        Color(hex: 0x6E5742),
            line:            Color(hex: 0xF0E5D2, alpha: 0.08),
            lineStrong:      Color(hex: 0xF0E5D2, alpha: 0.16),
            glassBg:         Color(hex: 0x34281F, alpha: 0.55),
            glassBgStrong:   Color(hex: 0x34281F, alpha: 0.78),
            glassBorder:     Color(hex: 0xF0E5D2, alpha: 0.12),
            accent:          accent.c1,
            accent2:         accent.c2
        )
    }
}
