import Foundation

struct Prayer: Identifiable, Hashable {
    var id: String { name }
    let name: String
    let arabic: String
    let time: String
    let meta: String
    let isSunnah: Bool
}
