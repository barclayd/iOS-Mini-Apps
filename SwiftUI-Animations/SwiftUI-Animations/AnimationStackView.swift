//
//  AnimationStackView.swift
//  SwiftUI-Animations
//
//  Created by Daniel Barclay on 31/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct AnimationStackView: View {
    @State private var enabled = false

    var body: some View {
        Button("Tap here") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.orange : Color.pink
        )
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 90 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct AnimationStackView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStackView()
    }
}
