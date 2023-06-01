//
//  Cart.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/3/23.
//

import UIKit
struct Product{
    let id : String
    let name : String
    let photo : String
    let level : String
    let size : String
    let water : String
    let light : String
    let quatily : Int
    let category : Int
    
    init(object:Any){
        if let dic = object as? Dictionary<String,AnyObject>{
            id = dic["id"] as! String
            name = dic["name"] as! String
            science = dic["science"] as! String
            price = dic["price"] as! Int
            photo = dic["photo"] as! String
            level = dic["level"] as! String
            size = dic["size"] as! String
            light = dic["light"] as! String
            water = dic["water"] as! String
            quatily = dic["quality"] as! Int
            category = dic["category"] as! Int
            description = dic["description"] as! String
        }else{
            id = ""
            name = ""
            science = ""
            price = 0
            photo = ""
            level = ""
            size = ""
            water = ""
            quatily = 0
            category = 0
            description = ""
            light = ""
        }
    }
}
