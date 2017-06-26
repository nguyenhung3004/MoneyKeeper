//
//  BaseModelController.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 6/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class BaseViewController: NSObject, UIPageViewControllerDataSource {
    
    var viewControllers: [UIViewController] = {
        let mainTableVC = MainTableVC.instance
        let redVC = RedVC.instance
        let greenVC = GreenVC.instance
        let blueVC = BlueVC.instance
        
        let menuCOntrollers = [mainTableVC,redVC,greenVC, blueVC]
        
        return menuCOntrollers
    }()
    
    var index = 0
    
    func viewControllerAtIndex(_ index : Int) -> UIViewController? {
        if (self.viewControllers.count == 0) || (index >= self.viewControllers.count) || (index < 0){
            return nil
        }
        
        self.index = index
        
        return viewControllers[index]
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        return viewControllers.index(of: viewController) ?? NSNotFound
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound){
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.viewControllers.count {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
}

