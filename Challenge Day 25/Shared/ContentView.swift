//
//  ContentView.swift
//  Shared
//
//  Created by Jonathan Copeland on 2020/12/31.
//

import SwiftUI

struct ContentView: View {
    var appChoices = ["Rock", "Paper", "Scissors"]
    @State var appChoicesValue = Int.random(in: 0...2)
    var condition = ["Win", "Lose"]
    @State var conditionValue = Int.random(in: 0...1)
    @State var playerScore = 0
    @State var turns = 10
    @State var playerChoice = 0
    @State private var showingScore = false
    
    var body: some View {
        
        VStack {
            Text("Remaining turns: \(turns)")
            Text("Player score: \(playerScore)")
            Text("App's move: \(appChoices[appChoicesValue])")
            Text("Condition: \(condition[conditionValue])")
            

            
            HStack {
                Button("Rock", action: {
                    myFunc(number: 0)
                })
                Button("Paper", action: {
                    myFunc(number: 1)
                })
                Button("Scissors", action: {
                    myFunc(number: 2)
                })
            }
        }
        
        .alert(isPresented: $showingScore) {
            Alert(title: Text("Over"), message: Text("Message"), dismissButton: .default(Text("Play Again")) {
                reset()
            })
        }
        
    }
    
    func myFunc(number: Int) {
        


        // thing A beats thing B if it’s one place to the right of it
        // the player tapped rock, the player was trying to win, and the app chose scissors, so add 1 point.
        
        if(conditionValue == 0) {
            if(( (appChoicesValue + 1) == number || (appChoicesValue + 1) == 3)) {
                playerScore = playerScore + 1
            } else {
                playerScore = playerScore - 1
            }
            
        } else {
            
            if(( (appChoicesValue - 1) == number || (appChoicesValue - 1) == -1)) {
                playerScore = playerScore + 1
            } else {
                playerScore = playerScore - 1
            }
            
        }
        
        turns = turns - 1
        conditionValue = Int.random(in: 0...1)
        appChoicesValue = Int.random(in: 0...2)
        
        if(turns == 0) {
            showingScore = true
        }
        
    }
    
    func reset() {
        playerScore = 0
        turns = 10
        conditionValue = Int.random(in: 0...1)
        appChoicesValue = Int.random(in: 0...2)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
