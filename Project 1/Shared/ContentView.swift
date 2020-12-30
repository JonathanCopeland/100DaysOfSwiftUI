//
//  ContentView.swift
//  Shared
//
//  Created by Jonathan Copeland on 2020/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let totalAmount = Double(billAmount) ?? 0
        
        let tipValue = totalAmount / 100 * tipSelection
        let grandTotal = totalAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        // return the total each person should spend
        
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let totalAmount = Double(billAmount) ?? 0
        
        let tipValue = totalAmount / 100 * tipSelection
        let grandTotal = totalAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    

    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount", text: $billAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100 ) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section (header: Text("What tip would you like to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) { 
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                            
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Total amount")) {
                    Text("R\(totalAmount, specifier: "%.2f")")
                }
                
                Section (header: Text("Amount per person")) {
                    Text("R\(totalPerPerson, specifier: "%.2f")")
                }
                

                
            }.navigationTitle("Simple Split")

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
