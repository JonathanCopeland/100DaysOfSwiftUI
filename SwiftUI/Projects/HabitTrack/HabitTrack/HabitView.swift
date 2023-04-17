//
//  HabitView.swift
//  HabitTrack
//
//  Created by Jonathan Copeland on 15/04/2023.
//

import SwiftUI

struct HabitView: View {
    
    @ObservedObject var data: Habits
    var habitItem : HabitItem
    
    var body: some View {
        List {
            Text("Completion count: \(habitItem.progress)")

            Button("Mark Completed") {
                var newActivity = habitItem
                newActivity.progress += 1
                
                if let index = data.items.firstIndex(of: habitItem) {
                    data.items[index] = newActivity
                }
            }

        }
        .navigationTitle(habitItem.name)

    }
    

    
}

struct HabitView_Previews: PreviewProvider {
    
    static var previews: some View {
        HabitView(data: Habits(), habitItem: HabitItem.example)
    }
}
