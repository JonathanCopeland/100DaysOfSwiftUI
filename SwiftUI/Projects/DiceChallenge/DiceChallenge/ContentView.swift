//
//  ContentView.swift
//  DiceChallenge
//
//  Created by Jonathan Copeland on 03/07/2023.
//

import SwiftUI

struct ContentView: View {
        
//    @StateObject var results = PreviousResults()
    @State private var showingPreviousResults = false

    @State private var testDie = Die.example1
//    @State private var diceGroup = DiceGroup.example
    
    @StateObject var dice = DiceSet()
    
    var die1 = Die(sides: 4)
    var die2 = Die(sides: 8)

        
    var body: some View {
        NavigationStack {
            
    
//            VStack {
//                ForEach(diceGroup.group) { dice in
//                    VStack (alignment: .center, spacing: 12) {
//                        Text("\(dice.rollResult())")
//                            .font(.title)
//                        Button {
//                            dice.roll()
//                        } label: {
//                            Text("Roll dice!")
//                        }
//                    }
//                    .padding()
//                }
//            }
            
            VStack {
                VStack (alignment: .center, spacing: 12) {
                    Text("\(testDie.rollResult())")
                        .font(.title)
                    Button {
                        testDie.roll()
                    } label: {
                        Text("Roll dice!")
                    }
                    Button {
                        dice.diceSet.append(Die(sides: Int.random(in: 1...100)))
                    } label: {
                        Text("Add dice")
                    }
                }
                .padding()
                

                
            }

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
//            .sheet(isPresented: $showingPreviousResults) {
//                PreviousResultsView(results: results)
//            }
        }
       
        
    }

    
    
}

#Preview {
    ContentView()
}

