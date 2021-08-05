//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "⚡️FlashChat"
        // 레이블에 0.1초씩 하나하나 글자가 나오게끔하는 코드
        for letter in titleText {
            // 타이머를 활용한다.
            Timer.scheduledTimer(withTimeInterval: 0.2 *  charIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
       
    }
    

}
