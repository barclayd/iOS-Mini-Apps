//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Daniel Barclay on 29/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmi: BMICalculator?
    
    @IBOutlet weak var bmiResult: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiResult.text = self.bmi?.textValue
        adviceLabel.text = determineBMIAdvice(bmi: bmi!.value!).advice.uppercased()
        adviceLabel.textColor = determineBMIAdvice(bmi: bmi!.value!).colour
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
       self.dismiss(animated: true, completion: nil)
    }
}
