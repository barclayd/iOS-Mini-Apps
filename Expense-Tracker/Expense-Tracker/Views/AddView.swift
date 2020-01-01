//
//  AddView.swift
//  Expense-Tracker
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = ExpenseType.leisure
    @State private var category = ""
    @State private var amount = ""

    static let categoryTypes = ["Personal", "work"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.categoryTypes, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
        }
        .navigationBarTitle("Add New Expense")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
