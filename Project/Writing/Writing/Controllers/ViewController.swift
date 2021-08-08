//
//  ViewController.swift
//  Writing
//
//  Created by IT learning on 2021/08/08.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    
    @IBOutlet weak var d: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        d.addTarget(self, action: #selector(goSecond), for: .touchUpInside)
    }

    
    @objc func goSecond() {
        let secondView = self.storyboard?.instantiateViewController(identifier: "StartView") as! StartViewController
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginView") as? LoginViewController else { return }
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginVC, animated: false)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
}

