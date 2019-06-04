//
//  ViewController.swift
//  Bandersnatch
//
//  Created by Daniel Barclay on 02/06/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allPages : StoryPageBank = StoryPageBank()
    var currentPage: StoryPages!
    var page: Int = 0
    var nextPage: Int!

    let imageOptions: Array = ["BlackMirror-C", "BlackMirror-WB"]
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var restartButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        print(sender.tag)
        if sender.tag == 1 {
            switch page {
            case 0:
                nextPage = 2
            case 1:
                nextPage = 2
            case 2:
                nextPage = 5
            default:
                print("illegal option")
            }
        } else if sender.tag == 2 {
            switch page {
            case 0:
                nextPage = 1
            case 1:
                nextPage = 3
            case 2:
                nextPage = 4
            default:
                print("illegal option")
            }
        } else if sender.tag == 3 {
            nextPage = 0
        }
        nextChapter()
        updateUI()
    }
    @IBOutlet weak var restartButton2: UIButton!
    
    func updateUI() {
        storyTextView.text = allPages.pageList[page].pageText
        
        if allPages.pageList[page].pageOptions.count < 2 {
            showHideOptionButtons(option: "hide")
        } else {
           
            showHideOptionButtons(option: "show")
            topButton.setTitle(allPages.pageList[page].pageOptions[0], for: .normal)
            bottomButton.setTitle(allPages.pageList[page].pageOptions[1], for: .normal)
        }
        
        if page > 2 {
            imageBackground.image = UIImage.init(named: imageOptions[0])
            storyTextView.textColor = UIColor.black
        }
    }
    
    func nextChapter() {
        page = nextPage
        currentPage = allPages.pageList[page]
    }
    
    func showHideOptionButtons(option: String){
        switch option {
        case "hide":
            topButton.isHidden = true
            bottomButton.isHidden = true
            restartButton.isHidden = false
        case "show":
            topButton.isHidden = false
            bottomButton.isHidden = false
            restartButton.isHidden = true
        default:
            topButton.isHidden = false
            bottomButton.isHidden = false
        }
    }

}

