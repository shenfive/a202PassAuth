//
//  CreateAccountViewController.swift
//  a202PassAuth
//
//  Created by 申潤五 on 2022/3/13.
//

import UIKit
import Firebase

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
        let pw1 = pw1.text ?? ""
        let pw2 = pw2.text ?? ""
        
        if validateEmail(theAccount) == false{
            print("Email 格式不對")
            showMsg("Email 格式不對")
            return
        }else{
            print("格式對了")
        }
        
        if pw1.count < 6 {
            showMsg("密碼至少 6 礮")
            return
        }
        
        if pw2 != pw1 {
            showMsg("兩次密碼必需相同")
            return
        }
        
        Auth.auth().createUser(withEmail: theAccount, password: pw1) { result, error in
            if let error = error{
                //失敗
                print("error")
                self.showMsg(error.localizedDescription)
                
            }else{
                //成玏
                self.navigationController?.popViewController(animated: true)
                
            }
        }
        
        
        
        
        
    }
    
    
    //檢查 Email 格式
    func validateEmail(_ candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
}

extension UIViewController{
    
    func showMsg(_ msg:String){
        let alert = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "朕知道了",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

