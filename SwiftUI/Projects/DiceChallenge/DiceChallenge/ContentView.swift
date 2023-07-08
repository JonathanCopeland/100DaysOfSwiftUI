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
            
            List {
                Text("Hello")
                Text("Hello")
            }
            
            
            
//            VStack (alignment: .center, spacing: 12) {
//                Text("\(result)")
//                    .font(.title)
//                Button {
//                    result = rollDice()
//                } label: {
//                    Text("Roll dice!")
//                }
//            }
            

            .toolbar {
                Button {
                    showingPreviousResults.toggle()
                } label: {
                    Image(systemName: "clock.arrow.circlepath")
                }
                Button {
                    showingPreviousResults.toggle()
                } label: {
                    Image(systemName: "dice")
                }
            }
            .sheet(isPresented: $showingPreviousResults) {
                PreviousResultsView(results: results)
            }
        }
       
        
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

