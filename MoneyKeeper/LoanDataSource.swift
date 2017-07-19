//
//  LoanDataSource.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 7/15/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class LoanDataSource: NSObject, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryDataService.shared.loanDeft.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath) 
        cell.imageView?.image = CategoryDataService.shared.loanDeft[indexPath.row].image
        cell.textLabel?.text = CategoryDataService.shared.loanDeft[indexPath.row].name
        return cell
    }
}
