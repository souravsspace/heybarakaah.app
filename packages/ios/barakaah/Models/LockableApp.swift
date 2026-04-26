import Foundation
import SwiftUI

struct LockableApp: Identifiable, Hashable {
    let id: String
    let name: String
    let colorHex: String
    let category: String
    var selected: Bool

    var color: Color {
        let hexString = colorHex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let hex = UInt(hexString, radix: 16) ?? 0x000000
        return Color(hex: hex)
    }
}
