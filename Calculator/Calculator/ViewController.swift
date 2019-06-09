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
    
    @IBOutlet weak var displayView: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        if sender.tag != 11 && sender.tag != 18 {
            updateDisplay(num: sender.tag)
            query.append(sender.tag)
        } else if sender.tag == 18 {
            resetCalc()
        } else {
            calculateQuery()
        }
    }
    
    func updateResultDisplay() {
        displayView.text = String(result)
    }
    
    func updateDisplay(num: Int) {
        
        var lastOperation: Int! = 1
        
        if query.count > 0 {
            lastOperation = query.last!
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
        
        let operationIdx = query.firstIndex(of: query.max()!)
        let firstNum = query.prefix(operationIdx!)
        let secondNum = query.suffix(query.count-1 - operationIdx!)
        let operation = query[operationIdx!]
        
        result = operationLookUp(firstNum: determineNum(nums: firstNum), op: operation, secondNum: determineNum(nums: secondNum))
        updateResultDisplay()
        query.removeAll()
//        query.append(result)
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
    }
}

