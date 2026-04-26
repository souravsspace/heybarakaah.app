import SwiftUI

struct GlassBackground: ViewModifier {
    @Environment(\.barakaahTheme) private var theme
    
    var strong: Bool = false
    
    func body(content: Content) -> some View {
        let palette = theme.palette
        let radius = theme.scaledRadius
        let isDark = theme.theme != .light
        
        content
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: radius, style: .continuous))
            .background(
                (strong ? palette.glassBgStrong : palette.glassBg)
                    .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            )
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(palette.glassBorder, lineWidth: 0.5)
            }
            .overlay {
                VStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: radius, style: .continuous)
                        .fill(isDark ? Color.white.opacity(0.06) : Color.white.opacity(0.55))
                        .frame(height: 1)
                    Spacer()
                }
                .mask {
                    RoundedRectangle(cornerRadius: radius, style: .continuous)
                }
            }
            .shadow(
                color: isDark ? Color.black.opacity(0.45) : Color.black.opacity(0.10),
                radius: 32,
                y: 8
            )
    }
}

extension View {
    func glass(strong: Bool = false) -> some View {
        modifier(GlassBackground(strong: strong))
    }
}
