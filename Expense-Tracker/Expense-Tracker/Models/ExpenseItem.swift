//
//  ExpenseItem.swift
//  Expense-Tracker
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

enum ExpenseType {
    case business
    case leisure
}

struct ExpenseItem: Identifiable {
    var id = UUID()
    var name: String
    var type: ExpenseType
    var cost: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
