//
//  NewCollectionCollectionViewCell.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit

class NewCollectionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var imPhoto: UIImageView!
    
    @IBOutlet weak var lbName: UILabel!
    
    func setup(with pr:Product) {
        lbName.text = pr.name
        let price = pr.price as NSNumber
        lbPrice.text = price.stringValue
        imPhoto.image = UIImage(named: pr.photo)
    }
    
}
