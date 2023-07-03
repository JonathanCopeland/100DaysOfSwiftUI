//
//  ContentView.swift
//  DiceChallenge
//
//  Created by Jonathan Copeland on 03/07/2023.
//

import SwiftUI

struct ContentView: View {
        
    @StateObject var results = PreviousResults()
    @State private var showingPreviousResults = false


    
    
    @State private var result = 0
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .center, spacing: 12) {
                Text("\(result)")
                    .font(.title)
                Button {
                    result = rollDice()
                } label: {
                    Text("Roll again!")
                }
            }
            .toolbar {
                Button {
                    showingPreviousResults.toggle()
                } label: {
                    Image(systemName: "clock.arrow.circlepath")
                }
            }
            .sheet(isPresented: $showingPreviousResults) {
                PreviousResultsView(results: results)
            }
        }
       
        
//        .sheet(isPresented: $showingAddHabit) {
//            AddView(habits: habits)
//        }
        
    }

    
    
    func rollDice() -> Int {
        let num = Int.random(in: 1...6)
        results.items.append(Result(result: num))
        
        return num
    }
    
    
}

#Preview {
    ContentView()
}



//let item = HabitItem(name: name, progress: progress, goal: goal)
//habits.items.append(item)
