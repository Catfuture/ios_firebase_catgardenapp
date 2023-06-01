//
//  ItemCart.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/4/23.
//

import Foundation
import UIKit
struct ItemCart{
    let id : String
    let name : String
    let price : Int
    let photo : String
    let quantity : String
    
    init(object:Any){
        if let dic = object as? Dictionary<String,AnyObject>{
            id = dic["id"] as! String
            name = dic["name"] as! String
            price = dic["price"] as! Int
            photo = dic["photo"] as! String
            quantity = dic["quantity"] as! String
        }else{
            id = ""
            name = ""
            price = 0
            photo = ""
            quantity = ""
        }
    }
}
