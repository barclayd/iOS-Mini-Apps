//
//  SecondViewController.swift
//  PassingData
//
//  Created by Daniel Barclay on 18/06/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit

protocol CanReceive {
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {

    var delegate : CanReceive?
    
    var data : String = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = data
    }
    
    @IBAction func sendDataBack(_ sender: Any) {
        delegate?.dataReceived(data: textInput.text!)
        dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataBack" {
            let firstVC = segue.destination as! ViewController
            
            firstVC.dataPassedBack = textInput.text!
            
        
        }
    
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
