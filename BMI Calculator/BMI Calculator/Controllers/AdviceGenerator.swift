//
//  AdviceGenerator.swift
//  BMI Calculator
//
//  Created by Daniel Barclay on 29/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit

struct BMIAdivce {
    var advice: String
    var colour: UIColor
}

func determineBMIAdvice(bmi: Float) -> BMIAdivce {
    
    switch bmi {
    case 0..<18.5:
        return BMIAdivce(advice: "Category: Underweight", colour: .blue)
    case 18.5..<24.9:
        return BMIAdivce(advice: "Category: Normal weight", colour: .green)
    case 25..<30:
        return BMIAdivce(advice: "Category: Overweight", colour: .yellow)
    case 30...1000:
        return BMIAdivce(advice: "Category: Obese", colour: .red)
    default:
        return BMIAdivce(advice: "BMI value could not be calculated. Please try again", colour: .gray)
    }
}
