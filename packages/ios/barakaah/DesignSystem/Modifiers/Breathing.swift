import SwiftUI

struct BreathingModifier: ViewModifier {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    let period: TimeInterval

    @State private var breathe = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(!reduceMotion && breathe ? 1.06 : 1.0)
            .opacity(!reduceMotion && breathe ? 0.85 : 0.5)
            .animation(
                .easeInOut(duration: period).repeatForever(autoreverses: true),
                value: breathe
            )
            .onAppear { breathe = true }
    }
}

extension View {
    func breathing(period: TimeInterval = 3) -> some View {
        modifier(BreathingModifier(period: period))
    }
}
