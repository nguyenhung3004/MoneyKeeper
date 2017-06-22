//
//  ViewController.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 6/20/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sideMenuContainerView: CustomContainerView!
    
    @IBOutlet weak var topSideMenuContraint: NSLayoutConstraint!
    
    @IBOutlet weak var coverButton: UIButton!
    
    @IBAction func sideMenuControl(_ sender: Any) {
        isSideMenuOpen = !isSideMenuOpen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isSideMenuOpen = false
    }

    var isSideMenuOpen: Bool = true{
        didSet {
            if isSideMenuOpen{
                configForSideMenuOpeningState()
                
            } else {
                configForSideMenuClosingState()
            }
            UIView.animate(withDuration: 0.35, animations: {
                self.view.layoutIfNeeded()
            }) { (isSuccess) in
                if self.isSideMenuOpen{
                    
                } else {
                    self.sideMenuContainerView.clipsToBounds = true
                }
            }
        }
    }
    
    func configForSideMenuOpeningState(){
        sideMenuContainerView.clipsToBounds = false
        topSideMenuContraint.constant = 0
        self.coverButton.alpha = 0.4
        self.coverButton.backgroundColor = .gray
    }
    
    func configForSideMenuClosingState(){
        topSideMenuContraint.constant = -sideMenuContainerView.bounds.height
        self.coverButton.alpha = 0
    }
    @IBAction func clickCoverButton(_ sender: Any) {
        isSideMenuOpen = false
    }
    
}

extension ViewController: UITextFieldDelegate{
    
}
