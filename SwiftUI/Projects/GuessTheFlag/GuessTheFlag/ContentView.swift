//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jonathan Copeland on 14/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var tapped = 0
    @State private var turns = 0
    

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .gray.opacity(0.2) ]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the correct flag")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                    
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if(scoreTitle == "Wrong"){
                Text("That flag belongs to \(countries[tapped]).")
            } else {
                Text("Your score is \(score)")
            }
            
        }
        .alert("Game over", isPresented: $gameOver) {
            Button("Start again", action: newGame)
        } message: {
            Text("You achieved a score of: \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        
        tapped = number
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        


        showingScore = true
    }
    
    func askQuestion() {
        
        if(turns == 2) {
            gameOver = true
            return
        }
        
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        turns += 1
    }
    
    func newGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        turns = 0
        score = 0

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
