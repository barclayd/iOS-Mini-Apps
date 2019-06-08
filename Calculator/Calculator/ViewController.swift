//
//  ViewController.swift
//  Calculator
//
//  Created by Daniel Barclay on 08/06/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var result: Int = 0
    var query: Array = [Int]()
    var queryBuilder: String = ""
    
    @IBOutlet weak var displayView: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateResultDisplay()
    }

    
    let actionLookUp: Dictionary = [
        10: ".",
        11: "equals",
        12: "add",
        13: "minus",
        14: "multiply",
        15: "divide",
        16: "percent",
        17: "plus-minus",
        18: "reset",
    ]
    
    func operationLookUp(firstNum: Int, op: Int, secondNum: Int) -> Float {
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
            return -1
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
        
        if num < 10 {
            queryBuilder += String(num)
            displayView.text = queryBuilder
        }
    }
    
    func calculateQuery() {
//      calculate index of operation within array by determining the max value in       array
        
        let operationIdx = query.firstIndex(of: query.max()!)
        let firstNum = query.prefix(operationIdx!)
        let secondNum = query.suffix(query.count-1 - operationIdx!)
        
        print ("query")
        dump(query)
        print("firstNum")
        print(firstNum[0])
        print("operation")
        print(query[operationIdx!])
        print("secondNum")
        dump(secondNum)
        print(secondNum[2])
        // TODO: handle decimal places and numbers greater than 1
        // map through numbers
        
        let operation = query[operationIdx!]
        
        result = Int(operationLookUp(firstNum: firstNum[0], op: operation, secondNum: secondNum[2]))
        updateResultDisplay()
        query.removeAll()
        query.append(result)
    }
    
    
    func resetCalc() {
        result = 0
        updateResultDisplay()
        query.removeAll()
        queryBuilder = ""
    }
}

