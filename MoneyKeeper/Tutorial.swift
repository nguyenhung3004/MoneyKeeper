//
//  Tutorial.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 7/19/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class Tutorial: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        pageControl.numberOfPages = Int(scrollView.contentSize.width / scrollView.frame.width)
    }
}
extension Tutorial: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}
