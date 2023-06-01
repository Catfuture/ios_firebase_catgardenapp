//
//  ProfileViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit
import Toast_Swift
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    //
    let user = UserDefaults.standard
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var imAvatar: UIImageView!
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var barSave: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.isEnabled = false
        if user.object(forKey: "user_id") != nil{
            
            let _user_id : String = user.object(forKey: "user_id") as! String
            ref.child("users").child(_user_id).observeSingleEvent(of: .value) { [self] Snapshot in
                txtName.text =  User(object: Snapshot.value).fullname
                txtEmail.text =  User(object: Snapshot.value).email
                txtPhoneNumber.text =  User(object: Snapshot.value).phone
                txtAddress.text =  User(object: Snapshot.value).address
            }
        }
        
    }
    
    @IBAction func barButtonSave(_ sender: UIBarButtonItem) {
        if txtName.text != "" && txtEmail.text != "" && txtAddress.text != "" && txtPhoneNumber.text != ""   {
            
            if user.object(forKey: "user_id") != nil{
                let _user_id : String = user.object(forKey: "user_id") as! String
                
                ref.child("users").child(_user_id).setValue(["user_id":_user_id,"fullname":self.txtName.text!,"address":self.txtAddress.text!,"phone":self.txtPhoneNumber.text!,"email":txtEmail.text!])
                 self.view.makeToast("Successly")

            }
        }
        else{
            self.view.makeToast("You have not selected the quantity")
        }    }
}
