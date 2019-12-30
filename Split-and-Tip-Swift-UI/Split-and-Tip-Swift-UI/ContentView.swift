//
//  ContentView.swift
//  Split-and-Tip-Swift-UI
//
//  Created by Daniel Barclay on 30/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount = ""
    @State private var tipPercentage = 1
    @State private var splitNumber = 0
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(splitNumber + 2)
        let tipSelection = Double(self.tipPercentages[tipPercentage])
        let bill = Double(billAmount) ?? 0
        
        let billWithTip = bill + ((bill/100) * tipSelection)
        return billWithTip / peopleCount
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $billAmount)
                        .keyboardType(.decimalPad)
                    Picker("Ways to split", selection: $splitNumber) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip would you like to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("Total Bill: £\(billAmount)")
                    Text("Total Bill + Tip: £\(self.totalPerPerson*Double(self.splitNumber + 2), specifier: "%.2f")")
                    Text("Bill per person: £\(self.totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Split & Tip")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
