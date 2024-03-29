//
//  ContentView.swift
//  WeSplit
//
//  Created by Jonathan Copeland on 13/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    @FocusState private var amountIsFocused: Bool
    
    var useRedText: Bool {
        let choice : Bool
        
        if(tipPercentage == 0) {
            choice = true
        } else {
            choice = false
        }
        
        return choice
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = Double(checkAmount / 100 * tipSelection)
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

    var total: Double {
        
        let total : Double
        
        if(tipPercentage == 0) {
            total = checkAmount
        } else {
            total = checkAmount + (checkAmount / Double(100 / tipPercentage))
        }
        
        
        return total
    }
    
    
    var body: some View {
        NavigationView() {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.identifier ))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<11) {
                            Text("\($0) people")
                        }
                    }
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                } 
                
                Section {
                    
                    HStack {
                        Text("\(total, format: .currency(code: Locale.current.currencyCode ?? "EUR"))")
                        Text("(\(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "EUR")) per person)")
                            .foregroundColor(useRedText ? .red : .secondary)
                    }

        
                } header: {
                    Text("Total")
                }
                
            }
            .navigationTitle("WeSplit")
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
