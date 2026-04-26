import Foundation

struct Dhikr: Identifiable, Hashable {
    let id: String
    let arabic: String
    let translit: String
    let meaning: String
    let target: Int
}
