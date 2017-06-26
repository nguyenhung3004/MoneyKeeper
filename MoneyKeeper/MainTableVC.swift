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
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet var rightView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        self.textField.rightView = rightView
        self.textField.rightViewMode = .always
    }
}
extension MainTableVC: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: Notification.Name.init("caculator"), object: nil, userInfo: nil)
        return false
    }
}
