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
        return BMIAdivce(advice: "Category: Underweight", colour: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
    case 18.5..<24.9:
        return BMIAdivce(advice: "Category: Normal weight", colour: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    case 25..<30:
        return BMIAdivce(advice: "Category: Overweight", colour: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
    case 30...1000:
        return BMIAdivce(advice: "Category: Obese", colour: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    default:
        return BMIAdivce(advice: "BMI value could not be calculated. Please try again", colour: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    }
}
