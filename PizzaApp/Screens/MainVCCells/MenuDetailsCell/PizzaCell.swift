//
//  PizzaDescriptionCell.swift
//  PizzaApp
//
//  Created by Mac on 6/30/23.
//

import UIKit

class PizzaCell: MenuDetailsBaseCell {
    
    static let PizzaDescriptionCell = "pizzaDescriptionCell"
    
    
    override func getMenuData() {
        NetworkManager.shared.requestDataFromServer(name: "") { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.menuDetails = data
                    self.detailsCollection.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
