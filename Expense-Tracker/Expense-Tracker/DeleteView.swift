//
//  DeleteView.swift
//  Expense-Tracker
//
//  Created by Daniel Barclay on 31/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct DeleteView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }

    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct DeleteView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteView()
    }
}
