//
//  ContentView.swift
//  Split-and-Tip-Swift-UI
//
//  Created by Daniel Barclay on 30/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Group {
                    Text("Hello, World!")
                        .padding(.top)
                }
                Text("Hello, World Again!")
                    .foregroundColor(Color.red)
            }
            .navigationBarTitle("Split & Tip", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
