//
//  ArchieveSwiftObjectView.swift
//  Expense-Tracker
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ArchieveSwiftObjectView: View {
    
    @State private var user = User(firstName: "Daniel", lastName: "Barclay")
    
    var body: some View {
        Button("User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ArchieveSwiftObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ArchieveSwiftObjectView()
    }
}
