//
//  Bill.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/2/23.
//

import Firebase
import FirebaseDatabase
import Foundation
import UIKit
class bill{
    let bill_id : String
    let fullname : String
    var address : String
    let phone : String
    let total : Int
    let date : String
    let status : String
    init(object:Any){
        if let dic = object as? Dictionary<String,AnyObject>{
            bill_id = dic["bill_id"] as! String
            fullname = dic["fullname"] as! String
            address = dic["address"] as! String
            phone = dic["phone"] as! String
            total = dic["total"] as! Int
            date = dic["date"] as! String
            status = dic["status"] as! String
            
        }else{
            bill_id = ""
            fullname = ""
            address = ""
            phone = ""
            total = 0
            date = ""
            status = ""
        }
    }
}

