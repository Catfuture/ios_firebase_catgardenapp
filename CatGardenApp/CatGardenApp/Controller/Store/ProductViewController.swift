//
//  ProductViewController.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit
import Firebase
import FirebaseDatabase
class ProductViewController: UIViewController {

    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var txtQuantity: UITextField!
    
    @IBOutlet weak var myStepper: UIStepper!
    var total = 0
    @IBOutlet weak var lbSale: UILabel!
    @IBAction func StepperQuantity(_ sender: UIStepper) {
        
        let value:Int = Int(myStepper.value)
        txtQuantity.text = String(value)
        let sale  = Float(item!.sale)
        var price = Float(item!.price)
        price = price * ((100-sale)/100)
        total = Int(price) * value
        lbTotal.text = String(total) + ".000 VND"
    }
    var item:Product? = nil
    let user = UserDefaults.standard
    @IBAction func btnAddtocart(_ sender: UIButton) {
        
        if txtQuantity.text != "0" {
            if user.object(forKey: "user_id") != nil{
                let _user_id : String = user.object(forKey: "user_id") as! String
                let sale  = Float(item!.sale)
                var price = Float(item!.price)
                price = price * ((100-sale)/100)
                ref.child("carts").child(_user_id).child(item!.id).setValue(["id":item?.id,"name":item?.name,"price": price,"photo":item?.photo,"quantity":txtQuantity.text])
                 self.view.makeToast("Successly")
                } else{
                    self.view.makeToast("You are not log in")
            }
        }
        else{
            self.view.makeToast("You have not selected the quantity")
        }
    }
    
    //care la level
   
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var lbSize: UILabel!
    @IBOutlet weak var lbLight: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbWater: UILabel!
    @IBOutlet weak var lbScience: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbCare: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPhoto.image = UIImage(named: item!.photo)
        lbName.text = item?.name
        
        let sale  = Float(item!.sale)
        var price = Float(item!.price)
        price = price * ((100-sale)/100)

        lbPrice.text = String(Int(price)) + ".000 VND"
        
        lbScience.text = item?.science
        lbDescription.text = item?.description
        lbCare.text = item?.level
        lbSize.text = item?.size
        lbLight.text = item?.light
        lbWater.text = item?.water
        
        //thiet lap goa tri tepper
        
    }
}
