//
//  ViewController.swift
//  BMI Calculator
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var calculateBMI: UIButton!
    
    var bmi = BMICalculator()
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmi = self.bmi
        }
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        bmi.calculate(weight: weightSlider.value, height: heightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
}

