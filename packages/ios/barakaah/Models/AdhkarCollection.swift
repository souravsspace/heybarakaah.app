import Foundation
import SwiftUI

enum AdhkarIcon: String, CaseIterable {
    case sunRise = "sun-rise"
    case sunSet = "sun-set"
    case star
    case moon
    case leaf
    case compass

    var iconView: some View {
        switch self {
        case .sunRise, .sunSet: AnyView(IconSun())
        case .star:              AnyView(IconStar())
        case .moon:              AnyView(IconMoon())
        case .leaf:              AnyView(IconLeaf())
        case .compass:           AnyView(IconCompass())
        }
    }
}

struct AdhkarCollection: Identifiable, Hashable {
    let id: String
    let name: String
    let arabic: String
    let sub: String
    let count: Int
    let icon: AdhkarIcon
}
