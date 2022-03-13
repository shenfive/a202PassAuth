//
//  ViewController.swift
//  a202PassAuth
//
//  Created by 申潤五 on 2022/3/13.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{
                print("登入ID:\(user.uid) :\(user.email):\(user.isEmailVerified)")
            }else{
                print("未登入")
            }
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func logOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
}

