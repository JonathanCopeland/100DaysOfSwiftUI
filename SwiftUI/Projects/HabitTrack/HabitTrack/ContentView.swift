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
                        HabitView(data: habits, habitItem: item)
                    } label: {
                        HStack {
                            Text(item.name)
                            Spacer()
                            
                            Text(String(item.progress))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: item))
                                .clipShape(Capsule())
                        }
                        
                    }
                }
                .onDelete(perform: deleteItems)

                
                
            }
            .navigationTitle("HabitTrack")
            .toolbar {
                Button {
                    showingAddHabit.toggle()
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
    
    func color(for item: HabitItem) -> Color {
        if item.progress < 3 {
            return .red
        } else if item.progress < 10 {
            return .orange
        } else if item.progress < 20 {
            return .green
        } else if item.progress < 50 {
            return .blue
        } else {
            return .indigo
        }
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


