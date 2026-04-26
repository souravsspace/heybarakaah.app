import Foundation

struct Ayah: Identifiable, Hashable {
    let id = UUID()
    let surah: String
    let ref: String
    let arabic: String
    let translit: String
    let translation: String
}
