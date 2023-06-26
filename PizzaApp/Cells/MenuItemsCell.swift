//
//  MenuItemsCell.swift
//  PizzaApp
//
//  Created by Mac on 6/26/23.
//

import UIKit



class MenuItemsCell: UICollectionViewCell {
    
    static let indentifier = "menuItemsCell"
    
    
    
    lazy var menuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 17.5
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.layer.borderColor = #colorLiteral(red: 0.9663912654, green: 0.7763177752, blue: 0.8327546716, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textColor = #colorLiteral(red: 0.9663912654, green: 0.7763177752, blue: 0.8327546716, alpha: 1)
        label.clipsToBounds = true
        return label
    }()
    
    weak var delegate: MenuButtonProtocol?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = #colorLiteral(red: 0.9514434934, green: 0.9609040618, blue: 0.9738582969, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        contentView.addSubview(menuLabel)
        
        NSLayoutConstraint.activate([
            menuLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            menuLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            menuLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override var isSelected: Bool {
        didSet {
            menuLabel.backgroundColor = isSelected ? #colorLiteral(red: 0.9663912654, green: 0.7763177752, blue: 0.8327546716, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            menuLabel.textColor = isSelected ? #colorLiteral(red: 0.9937410951, green: 0.1913594604, blue: 0.397490561, alpha: 1) : #colorLiteral(red: 0.9663912654, green: 0.7763177752, blue: 0.8327546716, alpha: 1)
            menuLabel.font = isSelected ? UIFont.systemFont(ofSize: 14, weight: .bold) : UIFont.systemFont(ofSize: 14, weight: .medium)
        }
    }
    
    func getTitles(name: String, selected: Bool) {
        menuLabel.text = name
        
    }
}
