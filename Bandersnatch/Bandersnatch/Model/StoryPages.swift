//
//  StoryPages.swift
//  Bandersnatch
//
//  Created by Daniel Barclay on 02/06/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import Foundation

class StoryPages {
    
    let pageText: String
    let pageOptions: Array<String>
    
    init(text: String, answerOptions: Array<String>) {
        pageText = text
        pageOptions = answerOptions
    }
}
