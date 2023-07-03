//
//  ComboCell.swift
//  PizzaApp
//
//  Created by Mac on 6/30/23.
//

import UIKit

class ComboCell: MenuDetailsBaseCell {
    
    static let ComboCellId = "comboCellId"
    
    
    
    override func getMenuData() {
        NetworkManager.shared.requestDataFromServerCombo(name: "combo") { result in
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
