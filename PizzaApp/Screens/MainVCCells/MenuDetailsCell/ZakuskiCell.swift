//
//  JuicesCell.swift
//  PizzaApp
//
//  Created by Mac on 6/30/23.
//

import UIKit

class ZakuskiCell: MenuDetailsBaseCell {
    
    static let juicesCellId = "juicesCellId"
    
    
    override func getMenuData() {
        acttivityIndicator.startAnimating()
        NetworkManager.shared.requestDataFromServerCombo(name: "zakuski") { result in
            switch result {
                
            case .success(let data):
                DispatchQueue.main.async {
                    self.menuDetails = data
                    self.detailsCollection.reloadData()
                    self.acttivityIndicator.stopAnimating()
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
    }

}
