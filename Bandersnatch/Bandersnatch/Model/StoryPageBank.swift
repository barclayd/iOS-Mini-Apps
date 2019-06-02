//
//  StoryPageBank.swift
//  Bandersnatch
//
//  Created by Daniel Barclay on 02/06/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import Foundation

class StoryPageBank {
    var pageList : Array = [StoryPages]()
    
    init() {
        pageList.append(StoryPages(text: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".", answerOptions: ["I\'ll hop in. Thanks for the help!", "Better ask him if he\'s a murderer first."]))
       pageList.append(StoryPages(text: "He nods slowly, unphased by the question", answerOptions: ["At least he\'s honest. I\'ll climb in.", "Wait, I know how to change a tire."]))
    }
}
