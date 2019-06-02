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

    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        page += 1
        nextChapter()
        updateUI()
        // TODO Step 4: Write an IF-Statement to update the views
        
        // TODO Step 6: Modify the IF-Statement to complete the story
        
    }
    
    func updateUI() {
        storyTextView.text = allPages.pageList[page].pageText
        topButton.setTitle(allPages.pageList[page].pageOptions[0], for: .normal)
        bottomButton.setTitle(allPages.pageList[page].pageOptions[1], for: .normal)
    }
    
    func nextChapter() {
        if page+1 <= allPages.pageList.count {
            currentPage = allPages.pageList[page]
        } else {
            print("End of story")
        }
    }

}

