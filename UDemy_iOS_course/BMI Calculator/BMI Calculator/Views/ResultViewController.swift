//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by IT learning on 2021/07/10.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue : String?
    var advice: String?
    var color: UIColor?
    @IBOutlet weak var colorView: UIImageView!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        adviceLabel.text = advice
        colorView.backgroundColor = color
        bmiLabel.text = bmiValue
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        // 이러면 현재 보여지는 뷰가 닫히게 된다.
        // 이 뷰는 ResultView 이므로 원래의 CalculateView로 돌아가고 싶을경우
        // 해당 뷰를 끄면 된다.
        self.dismiss(animated: true, completion: nil)
    }

}
