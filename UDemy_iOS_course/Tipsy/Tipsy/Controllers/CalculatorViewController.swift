//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UIView!
    
    
    var value = 0
    var cur: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tenPctButton.isSelected = false
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        
        cur = sender.currentTitle!
        if cur == "0%" {
            zeroPctButton.isSelected = !zeroPctButton.isSelected
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if cur == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = !tenPctButton.isSelected
            twentyPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = !twentyPctButton.isSelected
        }
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if cur == "0%" {
            print()
        } else if cur == "10%" {
            
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = !twentyPctButton.isSelected
        }
    }
}

