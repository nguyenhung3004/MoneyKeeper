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
    
    @IBOutlet weak var bottomTableVC: NSLayoutConstraint!
    @IBOutlet weak var bottomCalcu: NSLayoutConstraint!
    @IBOutlet weak var caculatorContainerView: UIView!
    

    @IBAction func sideMenuControl(_ sender: Any) {
        
        if isCaculatorOpen {
            configForKeyboardClose()
        }
        isSideMenuOpen = !isSideMenuOpen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isSideMenuOpen = false

        NotificationCenter.default.addObserver(self, selector: #selector(configForKeyboardOpen), name: Notification.Name.init("caculator"), object: nil)
        
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
    
    var isCaculatorOpen: Bool = true{
        didSet {
            if isCaculatorOpen{
                configForKeyboardOpen()
                
            } else {
                configForKeyboardClose()
            }
            UIView.animate(withDuration: 0.35, animations: {
                self.view.layoutIfNeeded()
            }) { (isSuccess) in
                if self.isCaculatorOpen{
                    
                } else {
                    self.caculatorContainerView.clipsToBounds = true
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
//        isCaculatorOpen = false
    }
    
    
    // Caculator
    func configForKeyboardOpen(){
        caculatorContainerView.clipsToBounds = false
        bottomCalcu.constant = 0
        bottomTableVC.constant = caculatorContainerView.bounds.height - (tabBarController?.tabBar.bounds.height)!
        tabBarController?.tabBar.isHidden = true
        UIView.animate(withDuration: 0.35, animations: {
            self.view.layoutIfNeeded()
        })
//        isCaculatorOpen = !isCaculatorOpen
    }
    
    func configForKeyboardClose(){
        bottomCalcu.constant = -caculatorContainerView.bounds.height
        bottomTableVC.constant = 0
        tabBarController?.tabBar.isHidden = false
    }
    
}

