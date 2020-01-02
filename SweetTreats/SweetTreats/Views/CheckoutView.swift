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

    @State private var confirmationMessage = ""
    @State private var showConfirmationMessage = false

    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/icecream")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                print("No data in response \(error?.localizedDescription ?? "Unknown error").")
                return
            }

            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.flavours[decodedOrder.flavour].lowercased()) icecreams are being carefully prepared by our master craftsmen!\n\n They will be with you shortly"
                self.showConfirmationMessage = true
            } else {
                print("Invalid response from server")
            }

        }.resume()
    }

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

                    Button("Place Order") {
                        self.placeOrder()
                    }.padding()
                }
            }
        }.navigationBarTitle("Checkout").alert(isPresented: $showConfirmationMessage) {
            Alert(title: Text("Order Complete"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
