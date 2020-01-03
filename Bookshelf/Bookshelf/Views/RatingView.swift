//
//  CustomStarView.swift
//  Bookshelf
//
//  Created by Daniel Barclay on 03/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColour = Color.gray
    var onColour = Color.yellow
    
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        }
        return onImage
    }
    
    var body: some View {
        HStack {
            if (label.isEmpty == false) {
                Text(label)
            }
            ForEach(1..<maximumRating+1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColour : self.onColour)
                    .onTapGesture {
                        self.rating = number
                }
            }
        }
    }
}

struct CustomStarView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
