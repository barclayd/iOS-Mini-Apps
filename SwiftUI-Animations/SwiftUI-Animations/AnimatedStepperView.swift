//
//  AnimatedStepperView.swift
//  SwiftUI-Animations
//
//  Created by Daniel Barclay on 31/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct AnimatedStepperView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1).repeatCount(3, autoreverses: true)
            ), in: 1...10)
            Spacer()
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimatedStepperView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedStepperView()
    }
}
