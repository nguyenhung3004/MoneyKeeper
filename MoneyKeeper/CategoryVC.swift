
//
//  ItemTableVC.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 7/4/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit


class CategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let loanDataSource = LoanDataSource()
    let loanDelegate = LoanDelegate()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    // MARK: - Table view data source
    enum segmentType: Int {
        case expense
        case loanDeft
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return CategoryDataService.shared.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryDataService.shared.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath) as UITableViewCell
        cell.textLabel?.text = CategoryDataService.shared.sections[indexPath.section].items[indexPath.row].name
        cell.imageView?.image = CategoryDataService.shared.sections[indexPath.section].items[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CategoryDataService.shared.sections[indexPath.section].collapsed
            ? 0 : 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        header.label.text = CategoryDataService.shared.sections[section].name
        header.image.image = CategoryDataService.shared.sections[section].image
        header.button.setImage(#imageLiteral(resourceName: "hide"), for: .normal)
        header.setCollapsed(CategoryDataService.shared.sections[section].collapsed)
        
        header.delegate = self
        header.section = section
        
        return header
    }
    
    @IBAction func segmentDidChanged(_ sender: Any) {
        let segment = sender as!UISegmentedControl
        switch segment.selectedSegmentIndex {
        case segmentType.expense.rawValue:
            tableView.dataSource = self
            tableView.delegate = self
            tableView.tableHeaderView?.frame.size.height = 44
        case segmentType.loanDeft.rawValue :
            tableView.dataSource = loanDataSource
            tableView.delegate = loanDelegate
            tableView.tableHeaderView?.frame.size.height = 0
        default:
            break
        }
        tableView.reloadData()
    }
}
extension CategoryVC: CollapsibleTableViewHeaderDelegate{
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int){
        let collapsed = !CategoryDataService.shared.sections[section].collapsed
        CategoryDataService.shared.sections[section].collapsed = collapsed

        header.setCollapsed(collapsed)
        
        tableView.beginUpdates()
        for i in 0..<CategoryDataService.shared.sections[section].items.count{
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
}
