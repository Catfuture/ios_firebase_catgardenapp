//
//  CartTableViewCell.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imPhoto: UIImageView!
    @IBOutlet weak var lbPrice: UILabel!
    //tong gia tien +so luong san pham do
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var txtQuantity: UITextField!
    @IBOutlet weak var myStepper: UIStepper!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    let user = UserDefaults.standard
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup(with cart : ItemCart) {
        
        
        lbName.text = cart.name
        //thay doi kieu du lieu thanh string
        let price = cart.price as NSNumber
        lbPrice.text = price.stringValue + ".000 VND"
        
        myStepper.value = Double(cart.quantity)!
       print(myStepper.value)
        imPhoto.image = UIImage(named: cart.photo)
        txtQuantity.text = cart.quantity
        
        let totalload = Float(price) * Float(cart.quantity)!
        lbTotal.text = String(totalload) + ".000 VND"
    }
    
    @IBAction func UIStepperQuantity(_ sender: UIStepper) {
        
        
    }
}
    

