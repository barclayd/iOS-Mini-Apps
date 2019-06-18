//
//  ViewController.swift
//  PassingData
//
//  Created by Daniel Barclay on 18/06/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanReceive {
    
    func dataReceived(data: String) {
        label.text = data
    }
    
    var dataPassedBack : String = ""

    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = dataPassedBack
    }

    @IBAction func sendButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "sendMe", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendMe" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.data = textField.text!
            secondVC.delegate = self
        }
    }
    
}

