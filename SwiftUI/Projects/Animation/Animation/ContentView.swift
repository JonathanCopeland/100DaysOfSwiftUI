//
//  ContentView.swift
//  Animation
//
//  Created by Jonathan Copeland on 05/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var willAnimate = false
    @State private var userTapped = 0
    @State private var animationAmount = 0.0

    var body: some View {
        VStack {
            ForEach (0..<5) { number in

                    Button("Tap Me \(number)") {
                        if (number == 0) {
                            withAnimation () {
                                animationAmount += 360.0
                            }
                        }

                        
                    }
                    .rotation3DEffect(
                        .degrees(animationAmount),
                        axis: (x: 0, y: 1, z: 0)
                    )
                
            }

            
//            if addShape {
//
//                if (userTapped == 0) {
//                    Rectangle()
//                        .fill(.red)
//                        .frame(width: 200, height: 200)
////                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                } else {
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(width: 200, height: 200)
////                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                }
//
//
//
//
//            }
            

        }
    }
    
//    func setAnimation() {
//        if (userTapped == 0) {
//                    willAnimate = true
//
//        } else {
//                    willAnimate = false
//
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContentView()
        }
    }
}
