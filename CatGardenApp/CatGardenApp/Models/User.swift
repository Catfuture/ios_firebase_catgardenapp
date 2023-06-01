//
//  User.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/2/23.
//

import Foundation
import UIKit
struct User{
    let id : String
    let fullname : String
    let address : String
    let phone : String
    let email : String
    init(object:Any) {
        if let dic = object as? Dictionary<String,AnyObject>{
            fullname = dic["fullname"] as! String
            address = dic["address"] as! String
            phone = dic["phone"] as! String
            email = dic["email"] as! String
            id = dic["user_id"] as! String
        }else{
             id = ""
             fullname = ""
             address = ""
             phone = ""
             email = ""
        }
        
    }
}

