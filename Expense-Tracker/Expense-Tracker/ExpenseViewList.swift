//
//  ExpenseViewList.swift
//  Expense-Tracker
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ExpenseViewList: View {
    @ObservedObject var expenses = Expenses()

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
            }
            .navigationBarTitle("Expense Tracker")
        }
    }
}

struct ExpenseViewList_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseViewList()
    }
}
