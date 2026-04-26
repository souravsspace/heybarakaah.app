import SwiftUI

struct PressScale: ViewModifier {
    @State private var isPressed = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? 0.985 : 1.0)
            .opacity(isPressed ? 0.92 : 1.0)
            .animation(.easeOut(duration: 0.12), value: isPressed)
            .onLongPressGesture(minimumDuration: 0, pressing: { pressing in
                withAnimation {
                    isPressed = pressing
                }
            }, perform: {})
    }
}

extension View {
    func pressScale() -> some View {
        modifier(PressScale())
    }
}
