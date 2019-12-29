//
//  CalculateBMI.swift
//  BMI Calculator
//
//  Created by Daniel Barclay on 29/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import Foundation

struct BMICalculator {
    
    var value: Float?
    var textValue: String?
    
    mutating func calculate(weight: Float, height: Float) {
        self.value = (weight)/(pow(height, 2))
        self.textValue = "\(String(format: "%.1f", self.value ?? 0.0))"
    }
}
