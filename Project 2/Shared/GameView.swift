//
//  GameView.swift
//  Shared
//
//  Created by Jonathan Copeland on 2020/12/03.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter

    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var countryNumber = 0
    
    @State private var timeRemaining = 5
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        
        ZStack {
        
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:30) {
                VStack{
                    Text("Tap the flag of").foregroundColor(.white)
                    Text(countries[correctAnswer]).foregroundColor(.white).font(.largeTitle)
                        .fontWeight(.black)
                    Text("Score \(score)")
                    Text("\(timeRemaining)")
                                       


                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original).clipShape(Capsule()).overlay(Capsule().stroke(Color.black, lineWidth: 1)).shadow(color: .black, radius: 2)

                    }
                }
                


            }.onReceive(timer) { time in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }
                else {
                    viewRouter.currentPage = .ScoreView
                }
            }
            
        }
        
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("That is the flag of \(self.countries[countryNumber].description)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
        

    }
    

    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score = score + 1
            self.askQuestion()
            
        } else {
            scoreTitle = "Wrong"
            showingScore = true
            countryNumber = number
        }

        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(ViewRouter())
    }
}
