//
//  ContentView.swift
//  Rocket-Launch
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in Image("spacex").resizable().scaledToFit().frame(width: geo.size.width)
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
