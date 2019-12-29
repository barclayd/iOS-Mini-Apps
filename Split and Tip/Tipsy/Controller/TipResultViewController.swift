//
//  TipResultViewController.swift
//  Tipsy
//
//  Created by Daniel Barclay on 29/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit

class TipResultViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var breakdownLabel: UILabel!
    
    var tip: Tip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if var calculatedTip = tip {
            amountLabel.text = calculatedTip.billPerPerson()
            breakdownLabel.text = "A bill of \(String(format: "%.2f", calculatedTip.billAmount)) split between \(calculatedTip.splitNumber) people, with \(calculatedTip.tipPercent)% tip."
        }
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
