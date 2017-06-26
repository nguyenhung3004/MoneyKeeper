//
//  PageVC.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 6/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDelegate {

    var modelController = BaseViewController()
    var startViewControllerIndex = 0
    var index = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = modelController
        
        if let startingController = modelController.viewControllerAtIndex(startViewControllerIndex){
            let viewControllers = [startingController]
            setViewControllers(viewControllers, direction: .forward, animated: true, completion: { (done) in })
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        jump(toIndex: index)
    }
    
    func jump(toIndex : Int, animated : Bool = true){
        guard toIndex != NSNotFound && toIndex >= 0 else {
            return
        }
        let direction : UIPageViewControllerNavigationDirection = toIndex > index ? .forward : .reverse
        
        if let viewController = modelController.viewControllerAtIndex(toIndex){
            setViewControllers([viewController], direction: direction, animated: true, completion: { (done) in })
        }
    }
}
