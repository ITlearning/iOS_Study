//
//  LoginViewController.swift
//  Writing
//
//  Created by IT learning on 2021/08/08.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var userPW: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginButton(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: userID.text!, password: userPW.text!) { (user, error) in
            if user != nil {
                print("Login Success")
                guard let mainVC = self.storyboard?.instantiateViewController(identifier: "MainView") as? ViewController else { return }
                
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: false)
            } else {
                print("Login Fail")
            }
        }
        
        
        
        
    }
}
