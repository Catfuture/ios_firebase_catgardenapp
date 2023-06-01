//
//  SeeViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit
import FirebaseDatabase
class SeeViewController: UIViewController {
    
    
    let user = UserDefaults.standard
    
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbInfomation: UILabel!
    @IBOutlet weak var imAvatar: UIImageView!
    
    @IBOutlet weak var btnLogOut: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if user.object(forKey: "user_id") != nil{
            
            let _user_id : String = user.object(forKey: "user_id") as! String
            ref.child("users").child(_user_id).observeSingleEvent(of: .value) { [self] Snapshot in
                lbUserName.text =  User(object: Snapshot.value).fullname
                lbInfomation.text =  User(object: Snapshot.value).email
            }
            } else{
                lbUserName.text = "Log in"
                lbInfomation.text =  ""
        }
    }
    
    @IBAction func btnLogout(_ sender: UIButton) {
        //user.set(Any?.self, forKey: "user_id")
        let src = self.storyboard?.instantiateViewController(withIdentifier: "Welcome") as! UINavigationController
        self.view.window?.rootViewController = src
        self.view.window?.makeKeyAndVisible()
    }
}

