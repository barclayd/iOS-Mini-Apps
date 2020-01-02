//
//  ImagePainView.swift
//  Spirograph
//
//  Created by Daniel Barclay on 02/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        Circle().strokeBorder(ImagePaint(image: Image("pawprints"), scale: 0.1), lineWidth: 20).frame(width: 300, height: 200)
    }
}

struct ImagePainView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}
