//
//  Tip.swift
//  Tipsy
//
//  Created by Daniel Barclay on 29/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import Foundation

struct Tip {
    var billAmount: Float
    var tipPercent: Int
    
    func billPerPerson(splitNumber: Int) -> String {
        let tipMultiplier = Float("1.\(self.tipPercent)")!
        let billWithTip = tipPercent == 0 ? self.billAmount : Float(self.billAmount * tipMultiplier)
        let billPerPerson = billWithTip / Float(splitNumber)
        return String(format: "%.2f", billPerPerson)
    }
}
