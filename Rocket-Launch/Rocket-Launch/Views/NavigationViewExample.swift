//
//  NavigationViewExample.swift
//  Rocket-Launch
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct NavigationViewExample: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                VStack {
                    NavigationLink(destination: Text("Detail \(row)")) {
                        Text("Hello, World! \(row)")
                    }
                    .navigationBarTitle("Swift UI")
                }
            }
        }
    }
}

struct NavigationViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewExample()
    }
}
