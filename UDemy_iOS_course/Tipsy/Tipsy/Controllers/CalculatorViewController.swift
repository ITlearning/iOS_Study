//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    
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
        billTextField.endEditing(true)
        cur = sender.currentTitle!
        if cur == "0%" {
            cur = "0"
            zeroPctButton.isSelected = !zeroPctButton.isSelected
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if cur == "10%" {
            cur = "10"
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = !tenPctButton.isSelected
            twentyPctButton.isSelected = false
        } else {
            cur = "20"
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = !twentyPctButton.isSelected
        }
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bill = Float(billTextField.text!)
        let people = Float(splitNumberLabel.text!)
        let tip = Float(cur!)
        let result = (bill! * (1 + tip! / 100)) / people!
        if segue.identifier == "goToResult" {
            let destVC = segue.destination as! ResultsViewController
            destVC.tipNumber = cur!
            destVC.peopleNumber = splitNumberLabel.text!
            destVC.totalNumber = String(format: "%.2f", result)
        }
    }
}


