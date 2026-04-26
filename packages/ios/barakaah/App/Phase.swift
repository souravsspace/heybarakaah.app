import Foundation

enum Phase {
    case splash
    case onboarding
    case app
}

enum Tab: String, CaseIterable {
    case home
    case salah
    case tasbih
    case profile
}

enum Route: Hashable {
    case quran
    case adhkar
    case appEditor
}
