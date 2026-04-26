import Foundation

enum Phase {
    case splash
    case onboarding
    case app
}

enum Tab: Int, CaseIterable {
    case home
    case prayer
    case dhikr
    case profile
}
