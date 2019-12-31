//
//  ContentView.swift
//  SwiftUI-Animations
//
//  Created by Daniel Barclay on 31/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonClick: CGFloat = 1

    var body: some View {
        Button("Tap!") {
            //            self.buttonClick += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.red).scaleEffect(buttonClick).opacity(Double(2 - buttonClick))
            .animation(
                Animation.easeInOut(duration: 2)
                    .repeatForever()
            )
        )
        .onAppear {
            self.buttonClick = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
