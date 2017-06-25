//
//  ViewExtension.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 6/24/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

@IBDesignable
class ViewExtension: UIView {
    @IBInspectable
    var cornerRadius: CGFloat = 0{
        didSet {
            if cornerRadius == -1 {
                self.layer.cornerRadius = self.bounds.width < self.bounds.height ? self.bounds.width * 0.5 : self.bounds.height * 0.5
            } else {
                self.layer.cornerRadius = cornerRadius
            }
            clipsToBounds = true
        }
    }
    
    @IBInspectable
    var borderWidth:Float = 0{
        didSet {
            self.layer.borderWidth = CGFloat(borderWidth)
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
