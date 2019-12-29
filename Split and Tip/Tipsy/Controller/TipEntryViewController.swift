//
//  TipEntryViewController.swift
//  Tipsy
//
//  Created by Daniel Barclay on 29/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit

class TipEntryViewController: UIViewController {

    @IBOutlet weak var billTotal: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var numberToSplitStepper: UIStepper!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    var tipAmount: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }
    
    func setBackgroundColour(activeButton: UIButton) {
        let tipOptions = [zeroPercentButton, tenPercentButton, twentyPercentButton]
        for option in tipOptions {
            if option == activeButton {
                option?.isSelected = true
            } else {
                option?.isSelected = false
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func tipAmount(_ sender: UIButton) {
        tipAmount = sender.tag
        setBackgroundColour(activeButton: sender)
    }
    
    @IBAction func splitNumberChanged(_ stepper: UIStepper) {
        splitLabel.text = String(format: "%.0f", stepper.value)
    }
    
    @IBAction func calculateTip(_ button: UIButton) {
        if let billAmount = billTotal.text {
            if billAmount.count > 0 && (Float(billAmount) != nil) {
                var tip = Tip(billAmount: Float(billAmount)!, tipPercent: tipAmount)
                print(tip.billPerPerson(splitNumber: Int(splitLabel.text!)!))
            }
        }
    }
}

