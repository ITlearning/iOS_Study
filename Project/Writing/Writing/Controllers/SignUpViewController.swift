//
//  SignUpViewController.swift
//  Writing
//
//  Created by IT learning on 2021/08/08.
//

import UIKit
import TextFieldEffects
import Pastel
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpText: UILabel!
    @IBOutlet weak var subText: UILabel!
    
    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.690415506, green: 0.5182294781, blue: 0.9437880516, alpha: 1)
        signUpText.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        subText.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.clipsToBounds = true
        self.navigationController?.navigationBar.tintColor = .white
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    
                }
            }
        }
    }
    
    func customTextField() {
    
    }

}
