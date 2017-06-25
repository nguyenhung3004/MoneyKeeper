//
//  MainTableVC.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 6/22/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class MainTableVC: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet var rightView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        self.textField.rightView = rightView
        self.textField.rightViewMode = .always
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension MainTableVC: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: Notification.Name.init("caculator"), object: nil, userInfo: nil)
        return false
    }
}
