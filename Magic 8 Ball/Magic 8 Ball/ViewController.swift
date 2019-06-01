//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Daniel Barclay on 01/06/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    var randomBallIndex: Int!
    
    let answersArray : Array = ["ball1", "ball2", "ball3", "ball4", "ball5"]

    @IBOutlet weak var ballImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update8Ball()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        update8Ball()
        AudioServicesPlaySystemSound(1520)
    }

    @IBAction func revealButtonPressed(_ sender: UIButton) {
        update8Ball()
    }
    
    func update8Ball() {
        randomBallIndex = Int.random(in: 0 ... 4)
        
        ballImageView.image = UIImage.init(named: answersArray[randomBallIndex])
    }
    
}

