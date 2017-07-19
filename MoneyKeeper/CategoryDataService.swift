//
//  CategoryDataService.swift
//  MoneyKeeper
//
//  Created by Hung Nguyen on 7/9/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

struct CustomCell {
    var name: String
    var image: UIImage
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}

struct Section {
    var name : String
    var image : UIImage
    var items : [CustomCell]
    var collapsed: Bool
    init (name : String, image: UIImage, items:[CustomCell], collapsed: Bool = false){
        self.name = name
        self.items = items
        self.collapsed = collapsed
        self.image = image
    }
}

class CategoryDataService {
    static let shared: CategoryDataService = CategoryDataService()
    private var _sections: [Section] = []
    var sections: [Section]{
        set {
            _sections = newValue
        }
        get {
            if _sections.count == 0 {
                updateSection()
            }
            return _sections
        }
        
    }
    
    private var _loanDeft: [CustomCell] = []
    var loanDeft: [CustomCell]{
        set {
            _loanDeft = newValue
        }
        get {
            if _loanDeft.count == 0 {
                updateLoanDeft()
            }
            return _loanDeft
        }
    }
    
    func updateSection(){
    _sections = [
        Section(name: "Food and Dining",
                image: #imageLiteral(resourceName: "Food and Dining"),
                items: [CustomCell(name: "Groceries", image: #imageLiteral(resourceName: "Groceries")),
                        CustomCell(name: "Restaurant", image: #imageLiteral(resourceName: "Restaurant")),
                        CustomCell(name: "Bar & Coffee", image: #imageLiteral(resourceName: "Bar & Coffee"))
            ]),
        Section(name: "Utilities",
                image: #imageLiteral(resourceName: "Utilities"),
                items: [CustomCell(name: "Electricity", image: #imageLiteral(resourceName: "Electricity")),
                        CustomCell(name: "Water", image: #imageLiteral(resourceName: "Water")),
                        CustomCell(name: "Internet", image: #imageLiteral(resourceName: "Internet")),
                        CustomCell(name: "Gas", image: #imageLiteral(resourceName: "Gas")),
                        CustomCell(name: "Home Phone", image: #imageLiteral(resourceName: "HomePhone")),
                        CustomCell(name: "Cable TV", image: #imageLiteral(resourceName: "Cable TV"))
            ]),
        Section(name: "Auto & Transport",
                image: #imageLiteral(resourceName: "Auto & Transport"),
                items: [CustomCell(name: "Fuel", image: #imageLiteral(resourceName: "Fuel")),
                        CustomCell(name: "Service & Parts", image: #imageLiteral(resourceName: "Service & Parts")),
                        CustomCell(name: "Parking", image: #imageLiteral(resourceName: "Parking")),
                        CustomCell(name: "Car wash", image: #imageLiteral(resourceName: "Car wash")),
                        CustomCell(name: "Taxi", image: #imageLiteral(resourceName: "Taxi"))
            ])
        ]
    }
    
    func updateLoanDeft(){
        _loanDeft = [
            CustomCell(name: "Lend", image: #imageLiteral(resourceName: "Checked")),
            CustomCell(name: "Repayment", image: #imageLiteral(resourceName: "Unchecked"))
        ]
    }
}
