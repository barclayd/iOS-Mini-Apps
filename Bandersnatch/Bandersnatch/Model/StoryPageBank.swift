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
        pageList.append(StoryPages(text: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box", answerOptions: ["I love Elton John! Hand him the cassette tape.", " It’s him or me. Take the knife and stab him"]))
        pageList.append(StoryPages(text: "What? Such a cop out! Did you know accidental traffic accidents are the second leading cause ofaccidental death for most adult age groups?", answerOptions: ["Blah blah", " Blah Blah Blah"]))
        pageList.append(StoryPages(text: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.", answerOptions: ["Blah blah", " Blah Blah Blah"]))
        pageList.append(StoryPages(text: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"", answerOptions: ["Blah blah", " Blah Blah Blah"]))
    }
}
