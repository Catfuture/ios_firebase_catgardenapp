//
//  CategoryTableViewCell.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var imPhoto: UIImageView!
    
    @IBOutlet weak var lbSale: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup(with pr : Product) {
        lbName.text = pr.name
        //thay doi kieu du lieu thanh string
        let sale  = Float(pr.sale)
        var price = Float(pr.price)
        //var tmp = price * ((100-Float(sale))/100)
        if String(sale) != "0.0" {
            
            lbSale.text = String(Int(sale)) + "%"
        }
        price = price * ((100-sale)/100)

        lbPrice.text = String(Int(price)) + ".000 VND"
        
        imPhoto.image = UIImage(named: pr.photo)
    }

}
