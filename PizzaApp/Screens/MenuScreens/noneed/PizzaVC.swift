//
//  PizzaVC.swift
//  PizzaApp
//
//  Created by Mac on 6/25/23.
//

import UIKit

class PizzaVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var pizzacategory = true
    

    var receviedData: [PizzaModel]      = []
    var saleData: [SaleModel]           = []
    var receviedMenuData: [MenuDetailsModel]   = []
    
    
    lazy var pizzaTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
        table.register(PizzaCell.self, forCellReuseIdentifier: PizzaCell.identifier)
        return table
    }()
    
    
    lazy var menuTable: UICollectionView = {
        let table = UICollectionView(frame: .zero, collectionViewLayout: flowLayout2())
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.showsHorizontalScrollIndicator = false
        table.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.indentifier)
        return table
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        
        DispatchQueue.main.async {
            self.receviedData           = pizzaData
            self.receviedMenuData       = menuData
            self.pizzaTable.reloadData()
            self.menuTable.reloadData()
        }
    }

    func setupView() {

        view.addSubview(menuTable)
        view.addSubview(pizzaTable)
        
        NSLayoutConstraint.activate([
            menuTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menuTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menuTable.heightAnchor.constraint(equalToConstant: 50),
            
            pizzaTable.topAnchor.constraint(equalTo: menuTable.bottomAnchor),
            pizzaTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pizzaTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pizzaTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receviedData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: PizzaCell.identifier, for: indexPath) as! PizzaCell

        cell.filloutTable(imagename: receviedData[indexPath.row].image, pizzaName: receviedData[indexPath.row].pizzaName, pizzaDescription: receviedData[indexPath.row].pizzaDescription, pizzaPrice: receviedData[indexPath.row].piizzaPrice)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


    
    func flowLayout2() -> UICollectionViewFlowLayout {
        
        let padding:CGFloat              = 5
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize              = CGSize(width: 100, height: 35)
        flowLayout.scrollDirection       = .horizontal
        return flowLayout
    }
}


extension PizzaVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return receviedMenuData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.indentifier, for: indexPath) as! MenuCell
        cell.getTitles(name: receviedMenuData[indexPath.row].name, selected: false)
        cell.delegate = self
        
        if pizzacategory == true, receviedMenuData[indexPath.row].name == "Пицца" {
            cell.menuButton.backgroundColor = #colorLiteral(red: 0.9597372413, green: 0.8177070618, blue: 0.8642491698, alpha: 1)
            cell.menuButton.layer.borderWidth = 0
            cell.menuButton.setTitleColor(#colorLiteral(red: 0.9926844239, green: 0.2269599438, blue: 0.4140040278, alpha: 1), for: .normal)
            cell.menuButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            pizzacategory = false
        }
        return cell
    }
}

extension PizzaVC: MenuButtonProtocol {
    func buttonTappedProtocol(sender: MenuCell) {
        sender.menuButton.backgroundColor = #colorLiteral(red: 0.9663912654, green: 0.7763177752, blue: 0.8327546716, alpha: 1)
        sender.menuButton.layer.borderWidth = 0
        sender.menuButton.setTitleColor(#colorLiteral(red: 0.9926844239, green: 0.2269599438, blue: 0.4140040278, alpha: 1), for: .selected)
        sender.menuButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
}
