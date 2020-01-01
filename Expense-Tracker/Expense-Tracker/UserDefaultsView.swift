//
//  UserDefaultsView.swift
//  Expense-Tracker
//
//  Created by Daniel Barclay on 31/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct UserDefaultsView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

    var body: some View {
        VStack {
            Text("Tap count: \(tapCount)")
            Button("Tap") {
                self.tapCount += 1
                UserDefaults.standard.set(self.tapCount, forKey: "Tap")
            }
        }
    }
}

struct UserDefaultsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsView()
    }
}
