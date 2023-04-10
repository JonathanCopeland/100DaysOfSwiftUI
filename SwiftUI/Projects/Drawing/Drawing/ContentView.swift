//
//  ContentView.swift
//  Drawing
//
//  Created by Jonathan Copeland on 08/04/2023.
//

import SwiftUI


struct ContentView: View {
    
    @State private var strokeValue = 10.00

    var body: some View {
    
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 250, y: 300))
                path.addLine(to: CGPoint(x: 250, y: 400))
                path.addLine(to: CGPoint(x: 150, y: 400))
                path.addLine(to: CGPoint(x: 150, y: 300))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 200))
            }
            .stroke(.blue, style: StrokeStyle(lineWidth: strokeValue, lineCap: .round, lineJoin: .round))
            
            HStack {

                Button("Decrease") {
                    withAnimation {
                        strokeValue -= 10
                    }
                }
                .foregroundColor(.blue)
                        .padding()
                        .background(Color.clear)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                
                Button("Increase") {
                    withAnimation {
                        strokeValue += 10
                    }
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                
                // mine IS animating... WHY??? 


                
            }

        }
        .padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


