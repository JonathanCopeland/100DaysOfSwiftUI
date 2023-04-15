//
//  ContentView.swift
//  HabitTrack
//
//  Created by Jonathan Copeland on 14/04/2023.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false


    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(habits.items) { item in
                    
                    NavigationLink{
                        HabitView(data: habits, habitItem: HabitItem(name: item.name, progress: item.progress, goal: item.goal))
                    } label: {
                        Text(item.name)
                    }
                    
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(item.name)
//                                .font(.headline)
//                            Text("\(item.progress) / \(item.goal) days completed")
//                        }
//
//                    }
                }
                .onDelete(perform: deleteItems)

                
                
            }
            .navigationTitle("HabitTrack")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddView(habits: habits)
            }
        }
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


