//
//  DrawingGroupView.swift
//  Spirograph
//
//  Created by Daniel Barclay on 02/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ColourCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) {
                value in Circle()
                    .inset(by: CGFloat(value))
//                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2)
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [self.colour(for: value, brightness: 1), self.colour(for: value, brightness: 0.5)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }

    func colour(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColourCycleView: View {
    @State private var colourCycle = 0.0

    var body: some View {
        VStack {
            ColourCyclingCircle(amount: self.colourCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colourCycle)
        }
    }
}

struct DrawingGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ColourCycleView()
    }
}
