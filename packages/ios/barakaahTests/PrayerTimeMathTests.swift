import Testing
@testable import barakaah

struct PrayerTimeMathTests {
    @Test func timeToMinutesMidnight() {
        #expect(PrayerTimeMath.timeToMinutes("00:00") == 0)
    }

    @Test func timeToMinutesEndOfDay() {
        #expect(PrayerTimeMath.timeToMinutes("23:59") == 1439)
    }

    @Test func minutesToTime() {
        #expect(PrayerTimeMath.minutesToTime(788) == "13:08")
    }

    @Test func formatDiffZero() {
        #expect(PrayerTimeMath.formatDiff(0) == "0m")
    }

    @Test func formatDiffMinutes() {
        #expect(PrayerTimeMath.formatDiff(22) == "22m")
    }

    @Test func formatDiffHours() {
        #expect(PrayerTimeMath.formatDiff(95) == "1h 35m")
    }

    @Test func formatDiffExactHour() {
        #expect(PrayerTimeMath.formatDiff(60) == "1h 00m")
    }

    @Test func nextPrayer() {
        let prayers = [
            Prayer(name: "Fajr", arabic: "", time: "05:14", meta: "", isSunnah: false),
            Prayer(name: "Dhuha", arabic: "", time: "08:42", meta: "", isSunnah: true),
            Prayer(name: "Zuhr", arabic: "", time: "13:08", meta: "", isSunnah: false),
            Prayer(name: "Asr", arabic: "", time: "16:34", meta: "", isSunnah: false),
        ]
        let result = PrayerTimeMath.nextPrayer(now: 800, in: prayers)
        #expect(result.prayer.name == "Asr")
        #expect(result.diff == 194) // 16:34 = 994 mins, 994 - 800 = 194
    }

    @Test func nextPrayerWrapsToTomorrow() {
        let prayers = [
            Prayer(name: "Fajr", arabic: "", time: "05:14", meta: "", isSunnah: false),
            Prayer(name: "Isha", arabic: "", time: "20:48", meta: "", isSunnah: false),
        ]
        let result = PrayerTimeMath.nextPrayer(now: 1300, in: prayers)
        #expect(result.prayer.name == "Fajr")
    }
}
