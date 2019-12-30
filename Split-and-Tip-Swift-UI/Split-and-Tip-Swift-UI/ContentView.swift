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
    @State private var tipPercentage = 10
    @State private var splitNumber = 1
    
    let tipPercentages = [5, 10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $billAmount)
                        .foregroundColor(.blue)
                        .keyboardType(.decimalPad)
                }
                Section {
                    Text("£\(billAmount)")
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
