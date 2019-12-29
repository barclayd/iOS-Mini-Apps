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
                let bill = Float(billAmount)!
                let tipMultiplier = Float("1.\(tipAmount)")!
                let billWithTip = tipAmount == 0 ? bill : Float(bill * tipMultiplier)
                let numberToSplitBy = Float(splitLabel.text!)
                print(String(format: "%.2f", billWithTip))
                let billPerPerson = billWithTip / numberToSplitBy!
                print(String(format: "%.2f", billPerPerson))
            }
        }
    }
}

