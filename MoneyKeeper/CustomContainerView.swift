//
//  CustomContainerView.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 6/22/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

@IBDesignable
class CustomContainerView: UIView {
    
    @IBInspectable
    var shadowColor: UIColor = UIColor.black{
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    var shadowOpacity: CGFloat = 0.8 {
        didSet {
            self.layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    @IBInspectable
    var shadowOffset: CGSize = CGSize.zero {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
}

