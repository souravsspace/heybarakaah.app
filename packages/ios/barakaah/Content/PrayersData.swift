import Foundation

let PRAYERS: [Prayer] = [
    Prayer(name: "Fajr", arabic: "الفجر", time: "05:14", meta: "before sunrise", isSunnah: false),
    Prayer(name: "Ḍuhā", arabic: "الضحى", time: "08:42", meta: "forenoon · sunnah", isSunnah: true),
    Prayer(name: "Ẓuhr", arabic: "الظهر", time: "13:08", meta: "midday", isSunnah: false),
    Prayer(name: "ʿAṣr", arabic: "العصر", time: "16:34", meta: "afternoon", isSunnah: false),
    Prayer(name: "Maghrib", arabic: "المغرب", time: "19:12", meta: "sunset", isSunnah: false),
    Prayer(name: "ʿIshāʾ", arabic: "العشاء", time: "20:48", meta: "night", isSunnah: false),
]

let HIJRI_TODAY = "17 Shawwāl 1447"
let GREGORIAN_TODAY = "Sunday, 26 April 2026"
