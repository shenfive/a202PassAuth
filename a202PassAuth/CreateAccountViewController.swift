//
//  CreateAccountViewController.swift
//  a202PassAuth
//
//  Created by 申潤五 on 2022/3/13.
//

import UIKit

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var pw1: UITextField!
    @IBOutlet weak var pw2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createAccount(_ sender: Any) {
        let theAccount = account.text ?? ""
        if validateEmail(theAccount) == false{
            print("Email 格式不對")
        }else{
            print("格式對了")
        }
        
        
    }
    
    
    //檢查 Email 格式
    func validateEmail(_ candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
}



