//
//  SignUpViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit
import Toast_Swift
import FirebaseAuth
import FirebaseDatabase
class SignUpViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtfullname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        //self.view.addGestureRecognizer(UIGestureRecognizer(target:self.view, action: Selector(("enEditing"))))
    }
    @IBAction func btnContinue(_ sender: Any) {
        view.endEditing(true)
        if txtEmail.text == "" && txtPass.text=="" {
            self.view.makeToast("Pleace enter all required field")
        }
        else{
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPass.text!) { [self] AuthData, error in
                if error != nil{
                    self.view.makeToast(error!.localizedDescription)
                }
                else{
                    ref.child("users").child((AuthData?.user.uid)!).setValue(["user_id":AuthData?.user.uid,"fullname":self.txtfullname.text!,"address":self.txtAddress.text!,"phone":self.txtPhone.text!,"email":(AuthData?.user.email)!])
                    self.userDefaults.set((AuthData?.user.uid)!, forKey: "user_id")
                    self.view.makeToast("thanh cong")
                    
                    let src = self.storyboard?.instantiateViewController(withIdentifier: "PageHome") as! UITabBarController
                    self.view.window?.rootViewController = src
                    self.view.window?.makeKeyAndVisible()
                    
                }
            }
        }
        
    }
}
