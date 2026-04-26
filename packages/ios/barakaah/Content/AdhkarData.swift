import Foundation

let ADHKAR_COLLECTIONS: [AdhkarCollection] = [
    AdhkarCollection(id: "morning", name: "Morning", arabic: "أذكار الصباح", sub: "After Fajr until midday", count: 27, icon: .sunRise),
    AdhkarCollection(id: "evening", name: "Evening", arabic: "أذكار المساء", sub: "After ʿAṣr until Maghrib", count: 25, icon: .sunSet),
    AdhkarCollection(id: "aftersalah", name: "After Ṣalāh", arabic: "أذكار بعد الصلاة", sub: "After every fardh", count: 12, icon: .star),
    AdhkarCollection(id: "sleep", name: "Before Sleep", arabic: "أذكار النوم", sub: "Protection through the night", count: 18, icon: .moon),
    AdhkarCollection(id: "food", name: "Eating", arabic: "أذكار الطعام", sub: "Before & after meals", count: 6, icon: .leaf),
    AdhkarCollection(id: "travel", name: "Travel", arabic: "أذكار السفر", sub: "Departure & return", count: 8, icon: .compass),
]
