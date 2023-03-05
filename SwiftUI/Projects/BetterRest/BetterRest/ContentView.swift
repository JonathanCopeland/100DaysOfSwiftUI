//
//  ContentView.swift
//  BetterRest
//
//  Created by Jonathan Copeland on 16/02/2023.
//

import CoreML
import SwiftUI


struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
        
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }

    
    var body: some View {
        
        
        NavigationView {
            
            
            Form {
                
                Section {
                    
                    VStack (alignment: .leading, spacing: 8) {
                        Text("When do you want to wake up?")
                            .font(.headline)

                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .onChange(of: wakeUp, perform: { _ in
                                calculateBedtime()
                            })

                    }

                    VStack (alignment: .leading, spacing: 8) {
                        
                        Text("Desired amount of sleep")
                            .font(.headline)
                        
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25, onEditingChanged: {_ in
                            calculateBedtime()
                        })
                    
                        
                    }
                    
                    VStack (alignment: .leading, spacing: 8) {
                        Text("Daily coffee intake")
                            .font(.headline)
                        Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20, onEditingChanged: {_ in
                            calculateBedtime()
                        })
                    }

                }

                
                
                Section {
                    VStack (alignment: .leading, spacing: 8) {
                        Text("\(alertTitle)")
                            .fontWeight(.semibold)
                        Text("\(alertMessage)")
                    }
                }
                
                
                
                
            }
            .navigationTitle("Better  
            
        }
        .onAppear(perform: calculateBedtime)

    }
    

    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep

            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
    }
    

    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
