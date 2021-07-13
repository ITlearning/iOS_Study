//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by IT learning on 2021/07/12.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalNumber: String?
    var peopleNumber: String?
    var tipNumber: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalNumber
        settingLabel.text = "Split between \(peopleNumber!) people, with \(tipNumber!)% tip."
    }
    

    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
