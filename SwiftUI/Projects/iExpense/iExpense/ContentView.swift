//
//  ContentView.swift
//  iExpense
//
//  Created by Jonathan Copeland on 20/03/2023.
//

import SwiftUI



struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        VStack {
            
            
            List {
                ForEach(numbers, id: \.self) {
                    Text("Row \($0)")
                }
            }

            Button("Add Number") {
                numbers.append(currentNumber)
                currentNumber += 1
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
