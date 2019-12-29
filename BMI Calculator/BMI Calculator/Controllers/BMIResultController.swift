//
//  BMIResultController.swift
//  BMI Calculator
//
//  Created by Daniel Barclay on 29/12/2019.
//  Copyright © 2019 Daniel Barclay All rights reserved.
//

import UIKit

class BMIResultController: UIViewController {
    
    var result: String
    
    init(result: String) {
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = self.result
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        view.addSubview(label)
    }
    
}
