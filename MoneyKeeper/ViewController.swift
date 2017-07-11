//
//  ViewController.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 6/20/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var sideMenuVC: SideMenuTableVC?
    var pageVC: PageVC?
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
    
    @IBOutlet weak var control: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isSideMenuOpen = false
        control.setTitle("Chi tiền", for: .normal)

        NotificationCenter.default.addObserver(self, selector: #selector(configForKeyboardOpen), name: Notification.Name.init("caculator"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(configForSideMenuClosingState), name: NSNotification.Name(rawValue: "hideSideMenu"), object: nil)
    }
    
    // Side Menu
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
        self.coverButton.isHidden = false
        self.coverButton.alpha = 0.4
        self.coverButton.backgroundColor = .gray
    }
    
    func configForSideMenuClosingState(){
        topSideMenuContraint.constant = -sideMenuContainerView.bounds.height
        self.coverButton.alpha = 0
        self.coverButton.isHidden = true
    }
    @IBAction func clickCoverButton(_ sender: Any) {
        isSideMenuOpen = false
    }
    
    // Caculator
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
    
    func configForKeyboardOpen(){
        caculatorContainerView.clipsToBounds = false
        bottomCalcu.constant = 0
        bottomTableVC.constant = caculatorContainerView.bounds.height - (tabBarController?.tabBar.bounds.height)!
        tabBarController?.tabBar.isHidden = true
        UIView.animate(withDuration: 0.35, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func configForKeyboardClose(){
        bottomCalcu.constant = -caculatorContainerView.bounds.height
        bottomTableVC.constant = 0
        tabBarController?.tabBar.isHidden = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sideMenu"{
            sideMenuVC = segue.destination as? SideMenuTableVC
            sideMenuVC?.delegate = self
        }
        if segue.identifier == "pageVC"{
            pageVC = segue.destination as? PageVC
        }
    }
}

extension ViewController: SideMenuRecordsDelegate{
    func passData(indexOf: Int) {
        isSideMenuOpen = false
        switch indexOf {
        case 1:
            pageVC?.jump(toIndex: 0)
        case 2:
            pageVC?.jump(toIndex: 1)
        case 3:
            pageVC?.jump(toIndex: 2)
        case 4:
            pageVC?.jump(toIndex: 3)
        default:
            return
        }
    }
    
    func passNameTitleMenu(name: String) {
        control.setTitle(name, for: .normal)
    }
}

