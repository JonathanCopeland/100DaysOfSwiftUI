//
//  ContentView.swift
//  MathMaster
//
//  Created by Jonathan Copeland on 14/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 2
    let selectionArray = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    @State private var questions: Int = 5
    @State private var questionsTracker: Int = 5
    let questionsArray = [5, 10, 20]
    
    
    
    @State private var gameStatus: Bool = false
    
    @State private var input: Int = 0
    @State private var multipier: Int = 2

    
    
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var tapped = 0
    @State private var turns = 0
    @State private var correctAnswer = 2
    
    
    


    
    var body: some View {
        
        NavigationView() {
            VStack {
                
                if (gameStatus) {
                    gameView
                }
                else {
                    settingsView
                }
                
                
                
            }
            .navigationTitle("MathMaster")
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                if(scoreTitle == "Wrong"){
                    Text("Wrong answer")
                } else {
                    Text("Your score is \(score)")
                }
                
            }
            .alert("Game over", isPresented: $gameOver) {
                Button("Start again", action: newGame)
                Button("Change settings", action: changeSettings)
            } message: {
                Text("You achieved a score of: \(score)")
            }
        }
        

        
        
    }
    
    
    func randomMultipier() {
        
        var x = Int.random(in: 2...12)
        
        multipier = x

    }
    
    func askQuestion() {
        
        if(questionsTracker == 1) {
            gameOver = true
            return
        }
        
        multipier = Int.random(in: 0...10)
        turns += 1
        questionsTracker -= 1
        

    }
    
    func submitAnswer(_ number: Int) {
        tapped = number
        
        correctAnswer = selection * selectionArray[multipier]

        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
        } else {
            scoreTitle = "Wrong"
        }
        
        
        showingScore = true
    }
    
    
    func newGame() {
        multipier = Int.random(in: 0...10)
        turns = 0
        score = 0
        questionsTracker = questions
        input = 0

    }
    
    func startGame() {
        gameStatus = true
        newGame()
    }
    
    func changeSettings() {
        gameStatus = false
        
    }
    

    
    var settingsView: some View {
        Form {
            Section {
                Picker("Tables:", selection: $selection) {
                    ForEach(selectionArray, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                Picker("Questions:", selection: $questions) {
                    ForEach(questionsArray, id: \.self) {
                        Text("\($0)")
                    }
                }
            } header: {
                Text("Settings")
            }
            
            Button("Start game") {
                startGame()
            }
            
        }

        
    }
    
    var gameView: some View {
        Form {
            Section {
                Text("\(selection) x \(selectionArray[multipier])")
                TextField("Input", value: $input, format: .number)
                    .keyboardType(.decimalPad)
                
                
            } header: {
                Text("Question")
            }
            
            Button("Submit") {
                submitAnswer(input)
            }
        }


    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
