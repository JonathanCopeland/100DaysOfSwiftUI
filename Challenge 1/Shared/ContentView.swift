//
//  ContentView.swift
//  Shared
//
//  Created by Jonathan Copeland on 2020/11/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cashAmount = ""
    @State private var currency1 = 0
    @State private var currency2 = 0
    @State private var symbol = "€"
    let currencyChoice2 = ["🇪🇺Euro", "🇬🇧Pound"]
    let converstionRatio = [18.26, 20.31]
    
    var convertedAmount: Double {
        let value = Double(cashAmount) ?? 0
        let convertedValue = (value * converstionRatio[currency2])
        
        return convertedValue
    }
    
    var symbolChoice : String {
        
        var choice = ""
        
        if currency2 == 0 {
            choice = "€"
        }
        else {
            choice = "£"
        }
        
        return choice
        
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section (header: Text("Rand Value")) {
                    TextField("Amount to convert", text: $cashAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section (header: Text("Converted Value")) {
                    Picker("Currency", selection: $currency2) {
                        ForEach(0 ..< currencyChoice2.count) {
                            Text("\(self.currencyChoice2[$0])")
                        }
                    }

                    Text("\(symbolChoice) \(convertedAmount, specifier: "%.2f")")
                    

                    
                }
                
            }.navigationTitle("Simple Currency")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
