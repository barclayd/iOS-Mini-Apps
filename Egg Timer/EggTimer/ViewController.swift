//
//  ViewController.swift
//  EggTimer

import UIKit

class ViewController: UIViewController {
    
    var timerLength: Int = 0
    var counter = 0
    
    var eggAlert: UIAlertController?
    
    var timer = Timer()
    
    let cookingTimes: [String: Int] = ["soft": 5, "medium": 8, "hard": 12]
    
    @IBAction func hardnessSelected(_ hardness: UIButton) {
        
        timer.invalidate()
        
        let eggSelected = hardness.currentTitle!
        
        timerLength = cookingTimes[eggSelected.lowercased()]!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: eggSelected, repeats: true)
    }
    
    func showAlert() {
        eggAlert = UIAlertController(title: "Egg is Ready!", message: "Your eggs should now be \(timer.userInfo!)", preferredStyle: .alert)
        eggAlert?.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            switch action.style{
            case .default, .cancel, .destructive:
                self.reset()
            @unknown default:
                self.reset()
            }}))
        self.present(eggAlert!, animated: true, completion: nil)
    }
    
    @objc func runTimedCode() {
        print("counter: \(counter)")
        if (counter == timerLength) {
            self.showAlert()
            timer.invalidate()
        }
        counter += 1
    }
    
    func reset() {
        counter = 0
        timerLength = 0
    }
}
