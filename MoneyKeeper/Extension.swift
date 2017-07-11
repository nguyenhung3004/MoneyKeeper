//
//  Extension.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 7/9/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

extension UIView{
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2){
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
}
