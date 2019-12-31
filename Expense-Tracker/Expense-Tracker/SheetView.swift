//
//  SheetView.swift
//  Expense-Tracker
//
//  Created by Daniel Barclay on 31/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View {
        VStack {
            Text("Second View Name: \(name)")
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct SheetView: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            SecondView(name: "Hi")
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
