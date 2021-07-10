//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func sliderMove(_ sender: UISlider) {
        let val = String(format: "%.2f", sender.value)
        heightLabel.text = "\(val)m"
    }
    
    
    @IBAction func weigthSliderMove(_ sender: UISlider) {
        let val = String(format: "%.0f", sender.value)
        weightLabel.text = "\(val)Kg"
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        // pow 거듭제곱 기능
        let bmi = weight / pow(height, 2)
        print(bmi)
    }
}

