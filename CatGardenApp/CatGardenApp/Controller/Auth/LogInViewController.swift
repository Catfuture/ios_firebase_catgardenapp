//
//  LogInViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit
import Toast_Swift
import FirebaseAuth
import FirebaseDatabase


class LogInViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    let userDefaults  = UserDefaults.standard
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var txtPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.addGestureRecognizer(UIGestureRecognizer(target:self.view, action: Selector(("enEditing"))))
       
    }
    
   
    @IBAction func btnForgotPass(_ sender: UIButton) {
        if txtEmail.text == ""{
            self.view.makeToast("Pleace enter email required field")
        }else{
            Auth.auth().sendPasswordReset(withEmail: txtEmail.text!){ error in
                if error != nil{
                    self.view.makeToast(error!.localizedDescription)
                }else{
                    self.view.makeToast("Check your email !")
                }
            }
        }
        
    }
    @IBAction func btnContinue(_ sender: Any) {
        view.endEditing(true)
        if txtEmail.text == "" && txtPass.text=="" {
            self.view.makeToast("Pleace enter all required field")
        }
        else{
            Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPass.text!) {[weak self] authData, error in
                if error != nil{
                    self?.view.makeToast(error!.localizedDescription)
                }else{
                    self?.userDefaults.set((authData?.user.uid)!, forKey: "user_id")
                    self?.view.makeToast("Successly")
                    let src = self?.storyboard?.instantiateViewController(withIdentifier: "PageHome") as! UITabBarController
                    self!.view.window?.rootViewController = src
                    self!.view.window?.makeKeyAndVisible()
                    
                }
            }
        }
    }
    
}
