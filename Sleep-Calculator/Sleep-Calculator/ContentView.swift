//
//  ContentView.swift
//  Sleep-Calculator
//
//  Created by Daniel Barclay on 30/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var wakeUp = defaultWakeTime
    
    @State private var showAlert = false
    @State private var suggestedBedTime: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text("Desired amount of sleep").frame(maxWidth: .infinity, alignment: .center).font(.headline)
                        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                            Text("\(sleepAmount, specifier: "%g") hours")
                        }
                    }
                    Section {
                        Text("When would you like to wake up?").frame(maxWidth: .infinity, alignment: .center).font(.headline)
                        DatePicker("Please select a time", selection: $wakeUp,
                                   displayedComponents: .hourAndMinute)
                    }
                    
                    Section {
                        Text("Daily Coffee Intake").frame(maxWidth: .infinity, alignment: .center).font(.headline)
                        Stepper(value: $coffeeAmount, in: 1...20, step: 1) {
                            Text("\(coffeeAmount) \(coffeeAmount > 1 ? "cups" : "cup")")
                        }
                    }
                }
            }
            .navigationBarTitle("Sleep Calculator", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: calculateBedTime) {
                Text("Calculate")
            })
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Suggsted Bed Time"), message: Text(suggestedBedTime), dismissButton: .default(Text("OK")))
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedTime() {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            suggestedBedTime = formatter.string(from: sleepTime)
        } catch {
            suggestedBedTime = "Sorry, an error occured when calculating a suggested bed time"
        }
        showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
