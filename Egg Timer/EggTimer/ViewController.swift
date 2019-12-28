//
//  ViewController.swift
//  EggTimer

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var timerLength: Int = 0
    var counter = 0
        
    var eggAlert: UIAlertController?
    
    var timerSound: AVAudioPlayer?
    
    var timer = Timer()
        
    let cookingTimes: [String: Int] = ["soft": 1, "medium": 8, "hard": 12]
    
    @IBAction func hardnessSelected(_ hardness: UIButton) {
        
        self.resetTimer()
        
        let eggSelected = hardness.currentTitle!
        
        let eggsType = eggSelected.lowercased()
        
        timerLength = cookingTimes[eggsType]!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: eggsType, repeats: true)
    }
    
    func showAlert() {
        eggAlert = UIAlertController(title: "Egg is Ready!", message: "Your \(timer.userInfo!) eggs should now have been cooked egg-ceptionally well", preferredStyle: .alert)
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
    
    @objc func updateTimer() {
        if (counter == timerLength * 60) {
            self.showAlert()
            self.playSound(soundFile: "alarm_sound.mp3")
            self.timer.invalidate()
        }
        self.counter += 1
        self.updateTitleText()
    self.progressBar.setProgress(self.updateProgressBar(), animated: true)
    }
    
    func playSound(soundFile: String) {
        
        let path = Bundle.main.path(forResource: soundFile, ofType:nil)!
        
        let url = URL(fileURLWithPath: path)
        
        do {
            timerSound = try AVAudioPlayer(contentsOf: url)
            timerSound?.numberOfLoops = -1
            timerSound?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func updateTitleText() {
        let timeToGo = (timerLength * 60) - counter
        if timeToGo > 59 {
            let eggsText = "cooking \(timer.userInfo!) eggs"
            let minutes = Float(timeToGo / 60).rounded(.down)
            let seconds = Float(timeToGo) - (minutes * 60)
            if (minutes > 1) {
                titleText.text = "\(String(format: "%.0f", minutes)) mins \(String(format: "%.0f", seconds)) seconds left \(eggsText)"
            } else {
                titleText.text = "1 min \(String(format: "%.0f", seconds)) seconds left \(eggsText)"
            }
        } else if timeToGo > 0 {
            let eggsText = "cooking \(timer.userInfo!) eggs"
            titleText.text = "\(timeToGo) seconds left \(eggsText)"
        } else {
            titleText.text = "Enjoy your eggcellent eggs!"
        }
    }
    
    func updateProgressBar() -> Float {
        return Float(counter)/Float(timerLength * 60)
    }
    
    func reset() {
        timerSound?.stop()
        counter = 0
        timerLength = 0
    }
    
    func resetTimer() {
        timer.invalidate()
        timerLength = 0
        counter = 0
        progressBar.setProgress(0.0, animated: true)
    }
}
