import Foundation

enum HeatmapGenerator {
    static let weeks = 14
    static let days = 7

    static func generate() -> [Int] {
        Array(repeating: 0, count: weeks * days).map { _ in
            let r = Double.random(in: 0...1)
            switch r {
            case 0.85...: return 4
            case 0.65...: return 3
            case 0.40...: return 2
            case 0.15...: return 1
            default:      return 0
            }
        }
    }

    private static let _cells: [Int] = generate()

    static var cells: [Int] { _cells }
}
