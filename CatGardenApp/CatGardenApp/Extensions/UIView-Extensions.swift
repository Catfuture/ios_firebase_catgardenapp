//
//  UIView-Extensions.swift
//  CatGardenApp
//
//  Created by MacOS 12 on 5/4/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
