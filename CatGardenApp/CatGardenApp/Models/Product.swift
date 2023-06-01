//
//  Product.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//


import Foundation
import UIKit
struct Product{
    let id : String
    let name : String
    let science : String
    let description : String
    let price : Int
    let sale : Int
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
            sale = dic["sale"] as! Int
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
            sale = 0
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
