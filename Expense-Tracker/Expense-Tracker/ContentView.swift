//
//  ContentView.swift
//  Expense-Tracker
//
//  Created by Daniel Barclay on 31/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

class Expense: ObservableObject {
    @Published var name: String
    @Published var category: String

    init(_ name: String, _ category: String) {
        self.name = name
        self.category = category
    }
}

struct ContentView: View {
    @ObservedObject private var expense = Expense("Shopping", "Leisure")

    var body: some View {
        Form {
            Text("Expense: \(expense.name) Category: \(expense.category)")
                .font(.largeTitle)
                .foregroundColor(.gray)
            HStack {
                TextField("Name", text: $expense.name)
                    Image(systemName: "sterlingsign.circle")
                    TextField("Category", text: $expense.category)
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
