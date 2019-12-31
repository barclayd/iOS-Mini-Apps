//
//  AnimationOnStateChangeView.swift
//  SwiftUI-Animations
//
//  Created by Daniel Barclay on 31/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct AnimationOnStateChangeView: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 10, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.blue).foregroundColor(.white).clipShape(Circle()).rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct AnimationOnStateChangeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOnStateChangeView()
    }
}
