//
//  CollapsibleTableViewHeader.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 7/8/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}

class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    let button = UIButton()
    let image = UIImageView()
    let label = UILabel()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
//        button.isSelected = false
        
        contentView.addSubview(button)
        contentView.addSubview(image)
        contentView.addSubview(label)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.backgroundColor = .red
//        label.textColor = .black
//        button.backgroundColor = .red
        let views = [
            "button" : button,
            "image" : image,
            "label" : label
        ]
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-8-[button(20)]-8-[image(26)]-8-[label]|",
            options: [],
            metrics: nil,
            views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-12-[button]-12-|",
            options: [],
            metrics: nil,
            views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-9-[image]-9-|",
            options: [],
            metrics: nil,
            views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-8-[label]-8-|",
            options: [],
            metrics: nil,
            views: views))
    }
    
    func tapHeader(_ gestureReconizer: UITapGestureRecognizer){
//        guard let cell = gestureReconizer.view as? CollapsibleTableViewHeader else { return
//        }
////        delegate?.toggleSection(self, section: cell.section)
    }
    func buttonTapped(_ button: UIButton){

        delegate?.toggleSection(self, section: section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        button.rotate(collapsed ? 0.0 : CGFloat(M_PI_2))
    }
}
