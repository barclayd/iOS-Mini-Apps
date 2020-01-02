//
//  Order.swift
//  SweetTreats
//
//  Created by Daniel Barclay on 02/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import Foundation

class Order: ObservableObject {
    static let flavours = ["Mint", "Chocolate", "Vanilla", "Cookie Dough", "Chocoolate Fudge"]

    @Published var flavour = 0
    @Published var quantity = 3
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var postcode = ""

    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                sauce = false
                topings = false
            }
        }
    }

    @Published var topings = false
    @Published var sauce = false
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || postcode.isEmpty {
            return false
        }
        return true
    }
}
