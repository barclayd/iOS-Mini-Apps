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
        updateLabelFromSlider(label: heightLabel, slider: heightSlider, measurement: "m")
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
                updateLabelFromSlider(label: weightLabel, slider: weightSlider, measurement: "KG")
    }
    
    func updateLabelFromSlider(label: UILabel, slider: UISlider, measurement: String) {
        label.text = "\(String(format: "%.1f", slider.value)) \(measurement)"
    }
}

