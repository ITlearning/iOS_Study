//
//  HomeViewController.swift
//  Writing
//
//  Created by IT learning on 2021/08/09.
//

import UIKit
class HomeViewController: UIViewController{

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var buttonLayout: UIButton!
    @IBOutlet weak var subLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2261704771, green: 0.3057078214, blue: 0.3860993048, alpha: 1)
        appNameLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        subLabel.textColor = #colorLiteral(red: 0.9306344697, green: 0.9306344697, blue: 0.9306344697, alpha: 1)
        //buttonLayout.imageView
    }


    @IBAction func bellButton(_ sender: UIButton) {
        print("Good")
        
    }
}
