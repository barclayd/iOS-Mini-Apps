//
//  ViewController.swift
//  Bitcoin-Tracker
//
//  Created by Daniel Barclay on 21/06/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let baseURL: String = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyList: Array <(String, String)> = [
            ("AUD", "$"),
            ("BRL","R$"),
            ("CAD","$"),
            ("CNY","CN¥"),
            ("EUR","€"),
            ("GBP","£"),
            ("HKD","$"),
            ("IDR","Rp"),
            ("ILS","₪"),
            ("INR","টকা"),
            ("JPY","￥"),
            ("MXN","$"),
            ("NZD","$"),
            ("PLN","zł"),
            ("RON","RON"),
            ("RUB","BYR"),
            ("SEK","kr"),
            ("SGD","$"),
            ("USD","$"),
            ("ZAR","R"),
        ]
    
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }
    
    //MARK: Protocol
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyList[row].0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currencySelected: (String, String) = currencyList[row]
        
        getBitcoinPrice(currency: currencySelected)
    }
    
    //MARK: Update UI
    func setBitcoinPrice(price: String, currencySymbol: String) {
        let symbolPlacementSpaceRequired: Bool = containsOnlyLetters(symbol: currencySymbol)
        if symbolPlacementSpaceRequired {
            bitcoinPriceLabel.text = "\(currencySymbol) \(price)"
        } else {
            bitcoinPriceLabel.text = "\(currencySymbol)\(price)"
        }
        
    }
    
    func containsOnlyLetters(symbol: String) -> Bool {
        var containsLetters: Bool = false
        for char in symbol {
            if (!(char >= "a" && char <= "z") && !(char >= "A" && char <= "Z") ) {
                containsLetters = false
            } else {
                containsLetters = true
                return containsLetters
            }
        }
        return containsLetters
    }
    
    //MARK: Server request
    func getBitcoinPrice(currency: (String, String)) {
        let url: String = "\(baseURL)" + currency.0
        
        Alamofire.request(url, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                let bitcoinJSON = JSON(response.result.value)
                let result = bitcoinJSON["averages"]["day"]

                if let bitcoinResult: Float = result.float {
                    self.setBitcoinPrice(price: String(format: "%.2f", bitcoinResult), currencySymbol: currency.1)
                } else {
                    self.setBitcoinPrice(price: "Could not reach server...", currencySymbol: "")
                }
                
            } else {
                print("Error: \(response.result.error)")
                self.bitcoinPriceLabel.text = "Bitcoin Data Unavailable"
            }
        }
    }
}

