//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // NavigationView 안에서 title을 불러오면, 해당 Navigation Bar의 Main Title이 설정이 된다.
        title = "⚡️FlashChat"
        // NavigationItem 중 BackButton을 지운다.
        // 위 코드의 NavigationView만 해당된다.
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    

    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            // 루트 뷰 컨트롤러를 제외한 스택의 모든 뷰 컨트롤러가 팝업되어 제거된다.
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
      
    }
}
