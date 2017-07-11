//
//  HeaderCategoryTableViewCell.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 7/4/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class HeaderCategoryTableViewCell: UITableViewCell {
    var a = ""
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var label: UILabel!
    
//    weak var delegate: HeaderCategoryTableViewCellDelegate?
//    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


//    @IBAction func collapseCell(_ sender: UIButton) {
//        if sender.isSelected{
//            sender.setImage(#imageLiteral(resourceName: "show"), for: .normal)
//            sender.isSelected = false
//            delegate?.showCell(self.indexPath!)
//        } else {
//            sender.setImage(#imageLiteral(resourceName: "hide"), for: .normal)
//            sender.isSelected = true
//            delegate?.hiddenCell(self.indexPath!)
//        }
//    }
//    
}

//protocol HeaderCategoryTableViewCellDelegate: class {
//    func hiddenCell(_ indexPath: IndexPath)
//    func showCell(_ indexPath: IndexPath)
//}
