import SwiftUI

// MARK: - Accessibility Helpers

struct ReduceTransparencyModifier: ViewModifier {
    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency
    @Environment(\.barakaahTheme) private var theme

    func body(content: Content) -> some View {
        if reduceTransparency {
            content
                .background(theme.palette.glassBgStrong)
        } else {
            content
        }
    }
}

extension View {
    func accessibleGlass() -> some View {
        modifier(ReduceTransparencyModifier())
    }

    func accessibilityDecorative() -> some View {
        self.accessibilityHidden(true)
    }
}

/// Provide accessibility label for icon-only buttons
struct AccessibleButtonLabel: ViewModifier {
    let label: String

    func body(content: Content) -> some View {
        content
            .accessibilityLabel(label)
            .accessibilityAddTraits(.isButton)
    }
}

extension View {
    func accessibleLabel(_ label: String) -> some View {
        modifier(AccessibleButtonLabel(label: label))
    }
}
