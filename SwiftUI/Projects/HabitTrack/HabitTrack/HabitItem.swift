//
//  HabitItem.swift
//  HabitTrack
//
//  Created by Jonathan Copeland on 14/04/2023.
//

import Foundation

struct HabitItem: Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var progress: Int
    var goal: Int
}
