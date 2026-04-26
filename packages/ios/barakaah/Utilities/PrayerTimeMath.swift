import Foundation

enum PrayerTimeMath {
    static func timeToMinutes(_ time: String) -> Int {
        let parts = time.split(separator: ":").compactMap { Int($0) }
        guard parts.count == 2 else { return 0 }
        return parts[0] * 60 + parts[1]
    }

    static func minutesToTime(_ mins: Int) -> String {
        let h = mins / 60
        let m = mins % 60
        return String(format: "%02d:%02d", h, m)
    }

    static func nextPrayer(now: Int, in prayers: [Prayer]) -> (prayer: Prayer, diff: Int) {
        let fard = prayers.filter { !$0.isSunnah }
        for prayer in fard {
            let prayerMins = timeToMinutes(prayer.time)
            if prayerMins > now {
                return (prayer, prayerMins - now)
            }
        }
        guard let fajr = fard.first else { return (Prayer(name: "Fajr", arabic: "", time: "05:14", meta: "", isSunnah: false), 0) }
        let wrapDiff = 24 * 60 - now + timeToMinutes(fajr.time)
        return (fajr, wrapDiff)
    }

    static func formatDiff(_ minutes: Int) -> String {
        let h = minutes / 60
        let m = minutes % 60
        if h == 0 {
            return "\(m)m"
        }
        return "\(h)h \(String(format: "%02d", m))m"
    }
}
