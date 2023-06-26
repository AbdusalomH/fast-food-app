//
//  menuCell.swift
//  PizzaApp
//
//  Created by Mac on 6/23/23.
//

import UIKit

protocol MenuButtonProtocol: AnyObject {
    func buttonTappedProtocol(sender: MenuCell)
}

class MenuCell: UICollectionViewCell {
    
    static let indentifier = "menuCell"
    
    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 17.5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.9663912654, green: 0.7763177752, blue: 0.8327546716, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.932677041, green: 0.779578302, blue: 0.8366844762, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        return button
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
        contentView.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            menuButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            menuButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override var isSelected: Bool {
        didSet {
            menuButton.backgroundColor = isSelected ? #colorLiteral(red: 0.9663912654, green: 0.7763177752, blue: 0.8327546716, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            menuButton.titleLabel?.font = isSelected ? UIFont.boldSystemFont(ofSize: 14) : UIFont.systemFont(ofSize: 14, weight: .medium)
            menuButton.setTitleColor(isSelected ? .red : #colorLiteral(red: 0.9663912654, green: 0.7763177752, blue: 0.8327546716, alpha: 1), for: isSelected ? .selected : .normal)
        }
    }
    
    func getTitles(name: String, selected: Bool) {
        menuButton.setTitle(name, for: .normal)
        if selected == true {
            menuButton.isSelected = true
        } else {
            menuButton.isSelected = false
        }
    }
    
    @objc func menuButtonTapped() {
        delegate?.buttonTappedProtocol(sender: self)
    }
}

