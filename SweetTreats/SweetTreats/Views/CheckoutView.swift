//
//  CheckoutView.swift
//  SweetTreats
//
//  Created by Daniel Barclay on 02/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("ice1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.height)

                    Text("Your total order cost: £\(self.order.cost, specifier: "%.2f")")
                        .font(.title)

                    Button("Place Order") {}.padding()
                }
            }
        }.navigationBarTitle("Checkout")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
