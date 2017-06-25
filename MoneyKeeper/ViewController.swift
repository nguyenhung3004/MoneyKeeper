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
    
    @IBOutlet weak var caculatorContainerView: UIView!
    
    @IBOutlet weak var bottomCaculator: NSLayoutConstraint!
    
    @IBAction func sideMenuControl(_ sender: Any) {
        
        isSideMenuOpen = !isSideMenuOpen
        isCaculatorOpen = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isSideMenuOpen = false
        isCaculatorOpen = false
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
            })
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
        bottomCaculator.constant = 0
        tabBarController?.tabBar.isHidden = true
        UIView.animate(withDuration: 0.35, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func configForKeyboardClose(){
        bottomCaculator.constant = -(caculatorContainerView.bounds.height + (tabBarController?.tabBar.bounds.height)!)
        tabBarController?.tabBar.isHidden = false
    }
    
}

