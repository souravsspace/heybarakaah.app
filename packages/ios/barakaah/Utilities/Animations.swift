import SwiftUI

enum BarakaahAnimation {
    static let pageIn = Animation.timingCurve(0.2, 0.7, 0.3, 1, duration: 0.32)
    static let fadeIn = Animation.easeOut(duration: 0.4)
    static let tabSpring = Animation.spring(response: 0.35, dampingFraction: 0.7)
    static let toggleSpring = Animation.spring(response: 0.22, dampingFraction: 0.85)
    static let breatheFast = Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)
    static let breatheMedium = Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)
    static let breatheSlow = Animation.easeInOut(duration: 5).repeatForever(autoreverses: true)
}
