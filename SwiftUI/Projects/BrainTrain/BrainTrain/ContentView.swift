//
//  ContentView.swift
//  BrainTrain
//
//  Created by Jonathan Copeland on 16/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var scoreTitle = ""
    @State private var turns = 0
    private let options: [String] = ["Rock", "Paper", "Scissors"]
    private let optionsImages: [String] = ["✊", "🖐️", "✌️"]
    private let prompt: [String] = ["Win", "Lose"]
    @State private var score: Int = 0
    @State private var choiceMessage = Int.random(in: 0...2)
    @State private var promptMessage = Int.random(in: 0...1)
    @State private var correctChoice = 0
    
    
    var body: some View {
        VStack (spacing: 30) {
            
            VStack (spacing: 8) {
                Text("\(score)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.yellow)
                Text("SCORE")
                    .fontWeight(.semibold)
                    .foregroundColor(.brown)
            }
            .frame(minWidth: 100, maxWidth: 340, minHeight: 44, maxHeight: 84, alignment: .center)
            .foregroundColor(Color.black)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            
            Spacer()
            
            HStack {
                Text("\(prompt[promptMessage])")
                Text("against")
                Text("\(options[choiceMessage])")
            }
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.orange)
            
            
            Spacer()
            
            VStack {
                
                ForEach(0..<3) { number in

                    Button(action: {
                        buttonTapped(number)
                    }) {
                        VStack (spacing: 8) {
                            Text("\(optionsImages[number])")
                                .font(.title)
                            Text("\(options[number])")
                                .fontWeight(.semibold)
                        }
                        .frame(minWidth: 100, maxWidth: 340, minHeight: 44, maxHeight: 84, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.brown)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                    
                }
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
        }
        .alert("Game over", isPresented: $gameOver) {
            Button("Start again", action: newGame)
        } message: {
            Text("You scored \(score)")
        }
        
    }
    
    func buttonTapped(_ number: Int) {
        
        calc()

        if number == correctChoice {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }
    
    
    func askQuestion() {
        
        if(turns == 5) {
            gameOver = true
            return
        }
        
        choiceMessage = Int.random(in: 0...2)
        promptMessage = Int.random(in: 0...1)
        
        turns += 1
    }
    
    func newGame() {
        choiceMessage = Int.random(in: 0...2)
        promptMessage = Int.random(in: 0...1)
        
        turns = 0
        score = 0
    }
    
    func calc() {

        correctChoice = choiceMessage
        
        if(choiceMessage == 0 && promptMessage == 1){
            correctChoice = 2
        } else if (choiceMessage == 2 && promptMessage == 0){
            correctChoice = 0
        } else if (promptMessage == 0) {
            correctChoice += 1
        } else {
            correctChoice -= 1
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
