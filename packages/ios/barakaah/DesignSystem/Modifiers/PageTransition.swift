import SwiftUI

struct PageInModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .transition(
                .asymmetric(
                    insertion: .opacity
                        .combined(with: .offset(y: 6))
                        .animation(BarakaahAnimation.pageIn),
                    removal: .opacity
                )
            )
    }
}

extension View {
    func pageInTransition() -> some View {
        modifier(PageInModifier())
    }
}
