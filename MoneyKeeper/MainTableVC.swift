//
//  MainTableVC.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 6/22/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class MainTableVC: UITableViewController {
    
    static var instance: MainTableVC {
        let storyboard = UIStoryboard(name: "Records", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MainTableVC") as! MainTableVC
    }
    
    @IBOutlet weak var borrowToPay: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet var rightView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        self.textField.rightView = rightView
        self.textField.rightViewMode = .always
        self.borrowToPay.isSelected = true
    }
    
    enum CellIndex: Int {
        case distance1
        case textFieldCalcu
        case distance2
        case category
        case description
        case distance3
        case account
        case date
        case payee
        case event
        case distance4
        case borrow
        case lender
        case distance5
        case addImage
        case distance6
        case save
        case distance7
    }
    
    @IBAction func borrowToPay(_ sender: Any) {
        if borrowToPay.isSelected{
            borrowToPay.setImage(UIImage(named: "Checked"), for: .normal)
            borrowToPay.isSelected = false
        } else {
            borrowToPay.setImage(UIImage(named: "Unchecked"), for: .normal)
            borrowToPay.isSelected = true
        }
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case CellIndex.lender.rawValue:
            return borrowToPay.isSelected ? 0 : 46
        case CellIndex.textFieldCalcu.rawValue:
            return 70
        case CellIndex.distance1.rawValue, CellIndex.distance7.rawValue:
            return 10
        case CellIndex.distance2.rawValue,
             CellIndex.distance3.rawValue,
             CellIndex.distance4.rawValue,
             CellIndex.distance5.rawValue,
             CellIndex.distance6.rawValue:
            return 16
        default:
            return 46
        }
    }
}
extension MainTableVC: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: Notification.Name.init("caculator"), object: nil, userInfo: nil)
        return false
    }
}
