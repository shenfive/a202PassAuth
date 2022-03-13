//
//  ViewController.swift
//  a202PassAuth
//
//  Created by 申潤五 on 2022/3/13.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var statusText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        statusText.text = ""
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{
                print("登入ID:\(user.uid) :\(user.email):\(user.isEmailVerified)")
                
                
                self.statusText.text = self.statusText.text +
                "登入ID:\(user.uid)\n" +
                "email:\(user.email ?? "")\n" +
                "檢查郵件狀態：\(user.isEmailVerified)\n"
                
            }else{
                
                self.statusText.text = self.statusText.text + "己登出\n"
                print("未登入")
            }
        }
    }

    @IBAction func signIn(_ sender: Any) {
        let theAccount = account.text ?? ""
        let password1 = password.text ?? ""
        
        //省略檢查
        
        Auth.auth().signIn(withEmail: theAccount, password: password1, completion: nil)
        
        
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch{
            print(error.localizedDescription)
        }
    }
    
}

