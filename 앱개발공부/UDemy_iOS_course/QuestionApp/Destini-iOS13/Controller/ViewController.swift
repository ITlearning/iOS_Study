//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    
    var storyBrain = StoryBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // 사용자가 누른 버튼
        let userAnswer = sender.currentTitle!
        
        // 누른게 어디로 가는지 확인
        storyBrain.checkGoToNumber(userAnswer)
        
        updateUI()
        
    }
    
    func updateUI() {
        choiceOneButton.setTitle(storyBrain.getChoiceOne(), for: .normal)
        choiceTwoButton.setTitle(storyBrain.getChoiceTwo(), for: .normal)
        
        questionLabel.text = storyBrain.getQuestion()
        
    }
}

