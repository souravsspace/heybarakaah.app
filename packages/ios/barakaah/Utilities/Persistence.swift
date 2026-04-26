import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}

enum Persistence {
    @UserDefault(key: "barakaah.didOnboard", defaultValue: false)
    static var didOnboard: Bool

    @UserDefault(key: "barakaah.theme", defaultValue: "dark")
    static var themeRaw: String

    @UserDefault(key: "barakaah.accent", defaultValue: "terracotta")
    static var accentRaw: String

    @UserDefault(key: "barakaah.name", defaultValue: "Aisha")
    static var name: String

    @UserDefault(key: "barakaah.intentions", defaultValue: ["salah", "quran"])
    static var intentions: [String]

    @UserDefault(key: "barakaah.madhhab", defaultValue: "hanafi")
    static var madhhab: String

    @UserDefault(key: "barakaah.goal", defaultValue: "consistent")
    static var goal: String

    @UserDefault(key: "barakaah.dhikrIndex", defaultValue: 0)
    static var dhikrIndex: Int

    @UserDefault(key: "barakaah.dhikrCount", defaultValue: 0)
    static var dhikrCount: Int

    @UserDefault(key: "barakaah.streakDays", defaultValue: 23)
    static var streakDays: Int

    static func reset() {
        let keys = [
            "barakaah.didOnboard", "barakaah.theme", "barakaah.accent",
            "barakaah.name", "barakaah.intentions", "barakaah.madhhab",
            "barakaah.goal", "barakaah.dhikrIndex", "barakaah.dhikrCount",
            "barakaah.streakDays", "barakaah.lockedAppIds",
            "barakaah.barakaahTheme", "userName", "intentions",
            "madhhab", "goal", "lockableApps"
        ]
        for key in keys {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
}
