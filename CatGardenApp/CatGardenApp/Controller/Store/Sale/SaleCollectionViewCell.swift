//
//  SaleCollectionViewCell.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/3/23.
//

import UIKit

class SaleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var lbPrice: UILabel!
    
    @IBOutlet weak var lbSale: UILabel!
    func  setup(with pr:Product) {
        imgPhoto.image = UIImage(named: pr.photo)
        lbName.text = pr.name
        
        let sale  = Float(pr.sale)
        var price = Float(pr.price)
        //var tmp = price * ((100-Float(sale))/100)
        if String(sale) != "0.0" {
            
            lbSale.text = String(Int(sale)) + "%"
        }
        price = price * ((100-sale)/100)

        lbPrice.text = String(Int(price)) + ".000 VND"
        
    }
}
