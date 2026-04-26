import Foundation

struct Verse: Identifiable, Hashable {
    let n: Int
    var id: Int { n }
    let arabic: String
    let translit: String
    let translation: String
}
