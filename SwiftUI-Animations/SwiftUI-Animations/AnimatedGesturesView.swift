//
//  AnimatedGesturesView.swift
//  SwiftUI-Animations
//
//  Created by Daniel Barclay on 31/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct AnimatedGesturesView: View {
    @State private var dragAmount = CGSize.zero

    var body: some View {
        VStack {
            Spacer()
            Card(dragAmount: $dragAmount)
            Spacer()
            Card(dragAmount: $dragAmount)
            Spacer()
        }
    }
}

struct AnimatedGesturesView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGesturesView()
    }
}

struct Card: View {
    @Binding var dragAmount: CGSize

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(DragGesture()
                .onChanged {
                    self.dragAmount = $0.translation
                }
                .onEnded { _ in
                    withAnimation(.spring()) {
                        self.dragAmount = .zero
                    }
            })
    }
}
