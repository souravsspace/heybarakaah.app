import Foundation
import SwiftUI

@MainActor
@Observable
final class AppState {
    // MARK: - Phase & Navigation
    var phase: Phase = .splash
    var obStep: Int = 0
    var tab: Tab = .home
    var stack: [Route] = []

    // MARK: - User Input (collected in onboarding)
    var name: String {
        didSet { UserDefaults.standard.set(name, forKey: "userName") }
    }
    var intentions: Set<String> {
        didSet { UserDefaults.standard.set(Array(intentions), forKey: "intentions") }
    }
    var madhhab: String {
        didSet { UserDefaults.standard.set(madhhab, forKey: "madhhab") }
    }
    var goal: String {
        didSet { UserDefaults.standard.set(goal, forKey: "goal") }
    }
    var apps: [LockableApp] {
        didSet {
            if let data = try? JSONEncoder().encode(apps) {
                UserDefaults.standard.set(data, forKey: "lockableApps")
            }
        }
    }

    // MARK: - Dynamic Content
    var ayahIndex: Int = 0
    var dhikrIndex: Int = 0 {
        didSet { Persistence.dhikrIndex = dhikrIndex }
    }
    var dhikrCount: Int = 21 {
        didSet { Persistence.dhikrCount = dhikrCount }
    }
    var completed: [String: Bool] = [:]
    var currentMins: Int = 720

    // MARK: - Lock Overlay
    var lockOpen: Bool = false

    // MARK: - Theme
    var theme: BarakaahTheme = .default {
        didSet {
            if let data = try? JSONEncoder().encode(theme),
               let json = String(data: data, encoding: .utf8) {
                UserDefaults.standard.set(json, forKey: "barakaahTheme")
            }
        }
    }

    // MARK: - Computed Helpers
    var lockedAppsCount: Int {
        apps.filter(\.selected).count
    }

    var nextPrayer: (prayer: Prayer, diff: Int) {
        PrayerTimeMath.nextPrayer(now: currentMins, in: PRAYERS)
    }

    var ayah: Ayah {
        AYAHS[ayahIndex % AYAHS.count]
    }

    var dhikr: Dhikr {
        DHIKR_LIST[dhikrIndex % DHIKR_LIST.count]
    }

    // MARK: - Mutating Helpers
    func toggleApp(id: String) {
        if let idx = apps.firstIndex(where: { $0.id == id }) {
            apps[idx].selected.toggle()
        }
    }

    func toggleCompleted(prayerName: String) {
        completed[prayerName, default: false].toggle()
    }

    func pushScreen(_ route: Route) {
        stack.append(route)
    }

    func popScreen() {
        if !stack.isEmpty {
            stack.removeLast()
        }
    }

    // MARK: - Init with Persistence
    init() {
        let defaults = UserDefaults.standard
        name = defaults.string(forKey: "userName") ?? "Aisha"
        intentions = Set(defaults.stringArray(forKey: "intentions") ?? ["salah", "quran"])
        madhhab = defaults.string(forKey: "madhhab") ?? "hanafi"
        goal = defaults.string(forKey: "goal") ?? "consistent"

        if let data = defaults.data(forKey: "lockableApps"),
           let saved = try? JSONDecoder().decode([LockableApp].self, from: data) {
            apps = saved
        } else {
            apps = LOCKABLE_APPS
        }

        if let json = defaults.string(forKey: "barakaahTheme"),
           let data = json.data(using: .utf8),
           let saved = try? JSONDecoder().decode(BarakaahTheme.self, from: data) {
            theme = saved
        } else {
            theme = .default
        }

        // Restore dhikr state only if partially through a session
        dhikrIndex = Persistence.dhikrIndex
        dhikrCount = Persistence.dhikrCount
    }
}

// MARK: - Make BarakaahTheme Codable for persistence
extension BarakaahTheme: Codable {
    enum CodingKeys: String, CodingKey {
        case theme, accent, sans, arabic, fontScale, radius, blur
    }
    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        theme = try c.decode(Theme.self, forKey: .theme)
        accent = try c.decode(Accent.self, forKey: .accent)
        sans = try c.decode(SansChoice.self, forKey: .sans)
        arabic = try c.decode(ArabicChoice.self, forKey: .arabic)
        fontScale = try c.decode(Double.self, forKey: .fontScale)
        radius = try c.decode(Double.self, forKey: .radius)
        blur = try c.decode(Double.self, forKey: .blur)
    }
    public func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(theme, forKey: .theme)
        try c.encode(accent, forKey: .accent)
        try c.encode(sans, forKey: .sans)
        try c.encode(arabic, forKey: .arabic)
        try c.encode(fontScale, forKey: .fontScale)
        try c.encode(radius, forKey: .radius)
        try c.encode(blur, forKey: .blur)
    }
}

// Make Theme, Accent, SansChoice, ArabicChoice Codable
extension Theme: Codable {}
extension Accent: Codable {}
extension SansChoice: Codable {}
extension ArabicChoice: Codable {}
