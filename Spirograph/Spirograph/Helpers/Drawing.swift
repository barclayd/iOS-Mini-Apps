//
//  Drawing.swift
//  Spirograph
//
//  Created by Daniel Barclay on 02/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b

    while b != 0 {
        let temp = b
        b = a % b
        a = temp
    }
    return a
}
