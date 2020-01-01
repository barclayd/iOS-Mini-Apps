//
//  ExpenseViewList.swift
//  Expense-Tracker
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ExpenseListView: View {
    @ObservedObject var expenses = Expenses()

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Expense Tracker")
            .navigationBarItems(trailing: Button(action: {
                let expense = ExpenseItem(name: "Test", type: .leisure, cost: 15)
                self.expenses.items.append(expense)
            }) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.black)
            })
        }
    }

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ExpenseViewList_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListView()
    }
}
