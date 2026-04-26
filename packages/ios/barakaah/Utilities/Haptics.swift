import UIKit

enum Haptics {
    private static let lightGenerator = UIImpactFeedbackGenerator(style: .light)
    private static let softGenerator = UIImpactFeedbackGenerator(style: .soft)
    private static let rigidGenerator = UIImpactFeedbackGenerator(style: .rigid)
    private static let mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
    private static let notificationGenerator = UINotificationFeedbackGenerator()
    private static let selectionGenerator = UISelectionFeedbackGenerator()

    static func prepare() {
        lightGenerator.prepare()
        softGenerator.prepare()
        rigidGenerator.prepare()
        mediumGenerator.prepare()
        notificationGenerator.prepare()
        selectionGenerator.prepare()
    }

    static func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        switch style {
        case .light:  lightGenerator.impactOccurred()
        case .soft:   softGenerator.impactOccurred()
        case .rigid:  rigidGenerator.impactOccurred()
        case .medium: mediumGenerator.impactOccurred()
        case .heavy:  UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        @unknown default: break
        }
    }

    static func successNotification() {
        notificationGenerator.notificationOccurred(.success)
    }

    static func selection() {
        selectionGenerator.selectionChanged()
    }
}
