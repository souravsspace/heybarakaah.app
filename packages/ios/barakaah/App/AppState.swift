import Foundation
import SwiftUI

@MainActor
@Observable
final class AppState {
    var phase: Phase = .splash
    var currentTab: Tab = .home
    var lockOpen: Bool = false
    var theme: BarakaahTheme = .default
}
