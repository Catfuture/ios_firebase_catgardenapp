//
//  OptionTableViewCell.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/1/23.
//

import UIKit

class OptionTableViewCell: UITableViewCell {

    @IBOutlet weak var lbOption: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func setup(_title:String){
        lbOption.text = _title
    }

}
