import Foundation

struct Surah: Identifiable, Hashable {
    var id: Int { num }
    let num: Int
    let name: String
    let arabic: String
    let ayat: Int
    let place: String
}
