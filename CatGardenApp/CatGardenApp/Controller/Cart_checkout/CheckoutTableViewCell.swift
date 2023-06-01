//
//  CheckoutTableViewCell.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/5/23.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var lbPrice: UILabel!
    
    @IBOutlet weak var lbQuantity: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func setup(with cart : ItemCart) {
        lbName.text = cart.name
        //thay doi kieu du lieu thanh string
        let price = cart.price as NSNumber
        lbPrice.text = price.stringValue + ".000 VND"
        imgPhoto.image = UIImage(named: cart.photo)
        lbQuantity.text = cart.quantity
    }
}
