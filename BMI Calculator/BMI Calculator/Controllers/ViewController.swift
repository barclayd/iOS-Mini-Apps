//
//  ViewController.swift
//  BMI Calculator
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var calculateBMI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculateBMI.layer.cornerRadius = 25
    }

    @IBAction func heightSlider(_ height: UISlider) {
        updateLabelFromSlider(label: heightLabel, slider: heightSlider, measurement: "m", decimalPlaces: 2)
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
                updateLabelFromSlider(label: weightLabel, slider: weightSlider, measurement: "KG", decimalPlaces: 0)
    }
    
    func updateLabelFromSlider(label: UILabel, slider: UISlider, measurement: String, decimalPlaces: Int = 1) {
        label.text = "\(String(format: "%.\(decimalPlaces)f", slider.value)) \(measurement)"
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        let height = Float(heightSlider.value)
        let BMI = (weightSlider.value)/(pow(height, 2))
        let BMItext = "\(String(format: "%.1f", BMI))"
        
        let bmiResultController = BMIResultController(result: BMItext)
        self.present(bmiResultController, animated: true, completion: nil)
    }
}

