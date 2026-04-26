import SwiftUI

// MARK: - Barakaah Theme

struct BarakaahTheme: Equatable {
    var theme: Theme
    var accent: Accent
    var sans: SansChoice
    var arabic: ArabicChoice
    var fontScale: Double
    var radius: Double
    var blur: Double
    
    var palette: ColorPalette {
        ColorPalette.make(theme: theme, accent: accent)
    }
    
    var scaledRadius: CGFloat {
        radius
    }
    
    var scaledBlur: CGFloat {
        blur
    }
    
    static let `default` = BarakaahTheme(
        theme: .dark,
        accent: .terracotta,
        sans: .sf,
        arabic: .amiri,
        fontScale: 0.95,
        radius: 22,
        blur: 28
    )
}

// MARK: - Environment Integration

extension EnvironmentValues {
    @Entry var barakaahTheme: BarakaahTheme = .default
}

// MARK: - Convenience Color Accessors

extension EnvironmentValues {
    var barakaahPalette: ColorPalette {
        barakaahTheme.palette
    }
}

// MARK: - Background Gradient Factory

extension Color {
    static func bgGradient(for theme: Theme) -> RadialGradient {
        switch theme {
        case .light:
            RadialGradient(
                colors: [
                    Color(hex: 0xF5EDE0),
                    Color(hex: 0xEFE5D2),
                    Color(hex: 0xE2D2B5)
                ],
                center: .topLeading,
                startRadius: 0,
                endRadius: 500
            )
        case .dark:
            RadialGradient(
                colors: [
                    Color(hex: 0x221C17),
                    Color(hex: 0x1A1612),
                    Color(hex: 0x2C251F)
                ],
                center: .topLeading,
                startRadius: 0,
                endRadius: 500
            )
        case .sepia:
            RadialGradient(
                colors: [
                    Color(hex: 0x34281F),
                    Color(hex: 0x2A201A),
                    Color(hex: 0x3A3128)
                ],
                center: .topLeading,
                startRadius: 0,
                endRadius: 500
            )
        }
    }
}

// MARK: - Accent Tint Factory

extension ColorPalette {
    func accentTint() -> Color {
        accent.opacity(0.18)
    }
}

// MARK: - Font Scale Helpers

extension BarakaahTheme {
    func scaledFontSize(_ base: CGFloat) -> CGFloat {
        base * fontScale
    }
    
    func scaledLgTitle() -> Font {
        Typography.lgTitleFont(fontScale)
    }
    
    func scaledEyebrow() -> Font {
        Typography.eyebrowFont(fontScale)
    }
    
    func scaledScriptItalic() -> Font {
        Typography.scriptItalicFont(fontScale)
    }
    
    func scaledArabicBody(size: CGFloat = 22) -> Font {
        Typography.arabicBodyFont(arabic, size: size, scale: fontScale)
    }
    
    func scaledSans(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        Typography.sansFont(sans, size: size * fontScale, weight: weight)
    }
    
    func scaledSerif(size: CGFloat, weight: Font.Weight = .regular, italic: Bool = false) -> Font {
        Typography.serifFraunces(size: size * fontScale, weight: weight, italic: italic)
    }
}
