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
    
    var defaultValue: Float = 0.0
    
    @IBOutlet weak var bmiResult: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiResult.text = self.bmi?.textValue
        adviceLabel.text = determineBMIAdvice(bmi: bmi?.value ?? defaultValue).advice.uppercased()
        view.backgroundColor = determineBMIAdvice(bmi: bmi?.value ?? defaultValue).colour
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
       self.dismiss(animated: true, completion: nil)
    }
}
