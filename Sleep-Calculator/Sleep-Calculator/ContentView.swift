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
    @State private var wakeUp = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text("Desired amount of sleep").frame(maxWidth: .infinity, alignment: .center).font(.headline)
                        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                            Text("\(sleepAmount, specifier: "%g") hours")
                        }.padding()
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
                        }.padding()
                    }
                }
            }
            .navigationBarTitle("Sleep Calculator", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: calculateBedTime) {
                Text("Calculate")
            })
        }
    }
    
    func calculateBedTime() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
