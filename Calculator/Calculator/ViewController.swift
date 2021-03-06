//
//  ViewController.swift
//  Calculator
//
//  Created by Daniel Barclay on 08/06/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var result: Float = 0
    var query: Array = [Int]()
    var queryBuilder: String = ""
    var previousResult: Float = 0
    var calculationsMade: Int = 0
    
    @IBOutlet weak var displayView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResultDisplay()
    }
    
    
    func operationLookUp(firstNum: Float, op: Int, secondNum: Float) -> Float {
        switch op {
        case 12:
            return Float(firstNum + secondNum)
        case 13:
            return Float(firstNum - secondNum)
        case 14:
            return Float(firstNum * secondNum)
        case 15:
            return Float(firstNum / secondNum)
        default:
            return 0.0
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if calculationsMade > 0 && sender.tag < 10 && query.count == 0 {
            resetCalc()
        }
        if sender.tag != 11 && sender.tag != 18 {
            updateDisplay(num: sender.tag)
            query.append(sender.tag)
        } else if sender.tag == 18 || (round(previousResult) != 0 && sender.tag < 10) {
            resetCalc()
            updateResultDisplay()
        } else {
            calculateQuery()
        }
    }
    
    func updateResultDisplay() {
        
        let intResultToDisply = String(Int(result))
        
        if result == round(result) {
            displayView.text = intResultToDisply
        } else if intResultToDisply.count > 9 {
            let intNum = intResultToDisply.count
            let numDecimalPlaces = 9 - intNum
            if numDecimalPlaces > 0 {
                 displayView.text = String(format: "%.\(numDecimalPlaces)f", result)
            } else {
                displayView.text = intResultToDisply
            }
        } else {
            displayView.text = String(result)
        }
    }
    
    func updateDisplay(num: Int) {
        
        var lastOperation: Int = 1
        
        if let lastNumber = query.last {
            if query.count > 0 {
                lastOperation = lastNumber
            }
        }
        
        if lastOperation > 9 {
            displayView.text = ""
            queryBuilder = ""
        }
        
        if num > -1 && num < 10 {
            queryBuilder += String(num)
            displayView.text = queryBuilder
        } else if num == -1 {
            queryBuilder += "."
            displayView.text = queryBuilder
        }
    }
    
    func calculateQuery() {
        //      calculate index of operation within array by determining the max value in array
        // no previous number calculated
        if query.count > 2 && calculationsMade == 0 {
            let operationIdx = query.firstIndex(of: query.max()!)
            let firstNum = query.prefix(operationIdx!)
            let secondNum = query.suffix(query.count-1 - operationIdx!)
            let operation = query[operationIdx!]
            
            result = operationLookUp(firstNum: determineNum(nums: firstNum), op: operation, secondNum: determineNum(nums: secondNum))
            afterResultCalc()
        } else if query.count > 1 && calculationsMade != 0 {
            let operationIdx = query.firstIndex(of: query.max()!)
            
            let secondNum = query.suffix(query.count-1 - operationIdx!)
            let operation = query[operationIdx!]
            
            result = operationLookUp(firstNum: previousResult, op: operation, secondNum: determineNum(nums: secondNum))
            
            afterResultCalc()
        }
        
    }
    
    func determineNum(nums: ArraySlice<Int>) -> Float {
        var determinedNum: String = ""
        for num in nums {
            if num == -1 {
                determinedNum += "."
            } else {
                determinedNum += String(num)
            }
        }
        
        return Float(determinedNum) as! Float
    }
    
    func resetCalc() {
        result = 0
        updateResultDisplay()
        query.removeAll()
        queryBuilder = ""
        previousResult = 0
        calculationsMade = 0
    }
    
    func afterResultCalc() {
        updateResultDisplay()
        query.removeAll()
        previousResult = result
        calculationsMade += 1
    }
}

