//
//  StaturateBlurView.swift
//  Spirograph
//
//  Created by Daniel Barclay on 02/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct SaturateBlurEffectView: View {
    @State private var amount: CGFloat = 0.0

    var body: some View {
        VStack {
            Image("pawprints")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)

            Slider(value: $amount).padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct StaturateBlurView_Previews: PreviewProvider {
    static var previews: some View {
        SaturateBlurEffectView()
    }
}
