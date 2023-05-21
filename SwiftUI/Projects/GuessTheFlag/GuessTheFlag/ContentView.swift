//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jonathan Copeland on 14/02/2023.
//

import SwiftUI


struct FlagImage: ViewModifier {
    var image: String

    func body(content: Content) -> some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

extension View {
    func Flag(with text: String) -> some View {
        modifier(FlagImage(image: text))
    }
}


struct ContentView: View {
    
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var tapped = 0
    @State private var turns = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    
    @State private var flagAngle = [0.0, 0.0, 0.0]
    @State private var flagOpacity = [1.0, 1.0, 1.0]
    @State private var flagBlur: [CGFloat] = [0, 0, 0]
    
    
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
                        Flag(with: countries[number])
                    }
                    .rotation3DEffect(.degrees(self.flagAngle[number]), axis: (x: 0, y: 1, z: 0))
                    .opacity(self.flagOpacity[number])
                    .blur(radius: self.flagBlur[number])
                    .animation(.default)
                    .accessibilityLabel(labels[countries[number], default: "Unknown flag"])

                    
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
            
            correctAnimation()
        } else {
            scoreTitle = "Wrong"
            wrongAnimation()
        }
        


        showingScore = true
    }
    

    
    func askQuestion() {
        
        if(turns == 5) {
            gameOver = true
            return
        }
        
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        turns += 1
        
        flagAngle = [0.0, 0.0, 0.0]
        flagOpacity = [1.0, 1.0, 1.0]
        flagBlur = [0, 0, 0]
    }
    
    func newGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        turns = 0
        score = 0
        
        flagAngle = [0.0, 0.0, 0.0]
        flagOpacity = [1.0, 1.0, 1.0]
        flagBlur = [0, 0, 0]

    }
    
    func correctAnimation() {
         for flag in 0...2 {
             if flag == correctAnswer {
                 flagAngle[flag] = 360.0
             } else {
                 flagOpacity[flag] = 0.25
             }
         }
     }
     
     func wrongAnimation() {
         for flag in 0...2 {
             if flag != correctAnswer {
                 flagBlur[flag] = 6
             }
         }
     }
 


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
