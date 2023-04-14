//
//  Habits.swift
//  HabitTrack
//
//  Created by Jonathan Copeland on 14/04/2023.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    

    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([HabitItem].self, from: savedHabits) {
                items = decodedHabits
                return
            }
        }

        items = []
    }
}
