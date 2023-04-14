//
//  AddView.swift
//  HabitTrack
//
//  Created by Jonathan Copeland on 14/04/2023.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var goal = 20
    @State private var progress = 0
    
    let types = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

    

    var body: some View {
        NavigationView {
            Form {
                TextField("Habit", text: $name)

                Picker("Days", selection: $goal) {
                    ForEach(types, id: \.self) {
                        Text("\($0)")
                    }
                }

            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let item = HabitItem(name: name, progress: progress, goal: goal)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
