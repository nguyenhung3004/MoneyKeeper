//
//  GreenVC.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 6/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class GreenVC: UIViewController {
    
    static var instance: GreenVC {
        let storyboard = UIStoryboard(name: "Records", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "GreenVC") as! GreenVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
