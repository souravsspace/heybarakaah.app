import SwiftUI

struct PulseRingModifier: ViewModifier {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @State private var pulse = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(!reduceMotion && pulse ? 1.6 : 1.0)
            .opacity(!reduceMotion && pulse ? 0 : 0.6)
            .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: pulse)
            .onAppear { pulse = true }
    }
}

struct PulseRippleModifier: ViewModifier {
    @State private var ripple = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(ripple ? 1.6 : 1.0)
            .opacity(ripple ? 0 : 0.6)
            .animation(.easeOut(duration: 0.6), value: ripple)
            .task {
                ripple = true
                try? await Task.sleep(for: .seconds(0.6))
                ripple = false
            }
    }
}

extension View {
    func pulseRing() -> some View {
        modifier(PulseRingModifier())
    }
    
    func pulseRipple() -> some View {
        modifier(PulseRippleModifier())
    }
}
