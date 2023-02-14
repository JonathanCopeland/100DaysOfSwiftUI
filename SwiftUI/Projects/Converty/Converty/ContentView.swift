//
//  ContentView.swift
//  Converty
//
//  Created by Jonathan Copeland on 14/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input: Double = 0.0
    @State private var selection: String = "Cups"
    @State private var output: Double = 0.0
    let choices = ["Cups", "Milliliters"]
    @FocusState private var amountIsFocused: Bool

    
    var conversion: Double {
        let input = Double(input)
        var output: Double = 0.0
        
        if (selection == "Cups") {
            output = input * (1/8)
        } else {
            output = input * 29.573530
        }
        
        
        let roundedDouble = round(output * 10) / 10.0
        
        return roundedDouble
    }
    
    var choice: Bool {
        
        if(selection == "Cups") {
            return true
        }
        return false
    }
    
    
    var body: some View {
//        Text("Hi!")
//        TextField("Ounches", value: $input, format: .currency(code: <#T##String#>))
        NavigationView() {
            Form {
                Section {
                    TextField("Ounces", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    
                    Picker("Convert to:", selection: $selection) {
                        ForEach(choices, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Ounches")
                }
                
                Section {
                    
                    if(choice) {
                        Text(String(format: "%.2f", conversion))
                    } else {
                        var x = conversion / 1000
                        Text("\(String(format: "%.2f", conversion)) ml")
                        Text("\(String(format: "%.2f", x)) L")
                    }

                } header: {
                    Text(selection)
                }
                
                
                
            }
            .navigationTitle("Converty")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
