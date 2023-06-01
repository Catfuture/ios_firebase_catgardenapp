//
//  ProductSellerCollectionViewCell.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit

class ProductSellerCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var lbPrice: UILabel!
    
    func  setup(with pr:Product) {
        imgPhoto.image = UIImage(named: pr.photo)
        lbName.text = pr.name
        let price = pr.price as NSNumber
        lbPrice.text = price.stringValue + ".000 VND"
    }
}
