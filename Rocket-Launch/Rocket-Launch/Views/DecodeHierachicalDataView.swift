//
//  DecodeHierachicalDataView.swift
//  Rocket-Launch
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct DecodeHierachicalDataView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
                {
                    "name": "Boris Johnson",
                    "address": {
                        "street": "Downing Street",
                        "city": "Westminister"
                    }
                }
            """
            struct User: Codable {
                struct Address: Codable {
                    var street: String
                    var city: String
                }

                var name: String
                var address: Address
            }

            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            } else {
                print("failed somehow")
            }
        }
    }
}

struct DecodeHierachicalDataView_Previews: PreviewProvider {
    static var previews: some View {
        DecodeHierachicalDataView()
    }
}
