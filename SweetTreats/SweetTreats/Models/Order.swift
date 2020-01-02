//
//  Order.swift
//  SweetTreats
//
//  Created by Daniel Barclay on 02/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import Foundation

class Order: ObservableObject, Codable {
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
                toppings = false
            }
        }
    }

    @Published var toppings = false
    @Published var sauce = false

    enum CodingKeys: CodingKey {
        case flavour, quantity, sauce, toppings, name, streetAddress, city, postcode
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(flavour, forKey: .flavour)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(sauce, forKey: .sauce)
        try container.encode(toppings, forKey: .toppings)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(postcode, forKey: .postcode)
    }

    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        flavour = try container.decode(Int.self, forKey: .flavour)
        quantity = try container.decode(Int.self, forKey: .flavour)
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        postcode = try container.decode(String.self, forKey: .postcode)
    }

    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || postcode.isEmpty {
            return false
        }
        return true
    }

    var cost: Double {
        var cost = Double(quantity * 2)
        cost += (Double(flavour) / 2)
        cost += (Double(flavour) / 2)
        if sauce {
            cost += Double(quantity) * 1.5
        }
        if toppings {
            cost += Double(quantity)
        }
        return cost
    }
}
