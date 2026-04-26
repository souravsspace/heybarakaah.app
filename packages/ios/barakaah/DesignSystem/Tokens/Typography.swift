import SwiftUI

// MARK: - Font Choices

enum SansChoice: String, CaseIterable {
    case sf
    case inter
    case geist
    case jakarta
}

enum ArabicChoice: String, CaseIterable {
    case amiri
    case scheherazade
    case lateef
}

// MARK: - Font Helpers

enum Typography {
    static func sansFont(_ choice: SansChoice, size: CGFloat, weight: Font.Weight = .regular) -> Font {
        switch choice {
        case .sf:
            Font.system(size: size, weight: weight, design: .default)
        case .inter:
            Font.custom("Inter-VariableFont", size: size)
                .weight(weight)
        case .geist:
            Font.custom("Geist-VariableFont", size: size)
                .weight(weight)
        case .jakarta:
            Font.custom("PlusJakartaSans-VariableFont", size: size)
                .weight(weight)
        }
    }

    static func serifFraunces(size: CGFloat, weight: Font.Weight = .regular, italic: Bool = false) -> Font {
        if italic {
            Font.custom("Fraunces-Italic-VariableFont", size: size)
                .weight(weight)
        } else {
            Font.custom("Fraunces-VariableFont", size: size)
                .weight(weight)
        }
    }

    static func arabicFont(_ choice: ArabicChoice, size: CGFloat, weight: Font.Weight = .regular) -> Font {
        switch choice {
        case .amiri:
            if weight >= .bold {
                Font.custom("Amiri-Bold", size: size)
            } else {
                Font.custom("Amiri-Regular", size: size)
            }
        case .scheherazade:
            if weight >= .bold {
                Font.custom("ScheherazadeNew-Bold", size: size)
            } else {
                Font.custom("ScheherazadeNew-Regular", size: size)
            }
        case .lateef:
            if weight >= .bold {
                Font.custom("Lateef-Bold", size: size)
            } else {
                Font.custom("Lateef-Regular", size: size)
            }
        }
    }

    // MARK: Reusable Text Styles

    static func lgTitleFont(_ scale: Double = 1.0) -> Font {
        serifFraunces(size: 38 * scale, weight: .light)
    }

    static func eyebrowFont(_ scale: Double = 1.0) -> Font {
        sansFont(.jakarta, size: 10.5 * scale, weight: .semibold)
    }

    static func scriptItalicFont(_ scale: Double = 1.0) -> Font {
        serifFraunces(size: 13 * scale, italic: true)
    }

    static func arabicBodyFont(_ choice: ArabicChoice = .amiri, size: CGFloat = 22, scale: Double = 1.0) -> Font {
        arabicFont(choice, size: size * scale)
    }
}
