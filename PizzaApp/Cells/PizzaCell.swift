//
//  Salecell.swift
//  PizzaApp
//
//  Created by Mac on 6/22/23.
//

import UIKit

class PizzaCell: UITableViewCell {
    
    static let identifier = "saleCell"
    
    
    lazy var pizzaImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    
    lazy var pizzaTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    
    lazy var pizzaDescripLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    
    lazy var pizzaPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.layer.borderColor = #colorLiteral(red: 0.9912737012, green: 0.1047256812, blue: 0.3643145561, alpha: 1)
        label.textColor = #colorLiteral(red: 0.9912737012, green: 0.1047256812, blue: 0.3643145561, alpha: 1)
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(pizzaImage)
        contentView.addSubview(pizzaTitle)
        contentView.addSubview(pizzaDescripLabel)
        contentView.addSubview(pizzaPriceLabel)

        NSLayoutConstraint.activate([
            
            pizzaImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pizzaImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pizzaImage.heightAnchor.constraint(equalToConstant: 150),
            pizzaImage.widthAnchor.constraint(equalToConstant: 150),
            
            pizzaTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            pizzaTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pizzaTitle.leadingAnchor.constraint(equalTo: pizzaImage.trailingAnchor, constant: 20),
            pizzaTitle.heightAnchor.constraint(equalToConstant: 20),
            
            pizzaPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            pizzaPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pizzaPriceLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            pizzaPriceLabel.heightAnchor.constraint(equalToConstant: 35),
            
            pizzaDescripLabel.leadingAnchor.constraint(equalTo: pizzaTitle.leadingAnchor),
            pizzaDescripLabel.topAnchor.constraint(equalTo: pizzaTitle.bottomAnchor, constant: 12),
            pizzaDescripLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pizzaDescripLabel.bottomAnchor.constraint(equalTo: pizzaPriceLabel.topAnchor, constant: -12)
        ])

    }
    
    func filloutTable(imagename: String, pizzaName: String, pizzaDescription: String, pizzaPrice: String) {
        
        pizzaImage.image = UIImage(named: imagename)
        pizzaTitle.text = pizzaName
        pizzaDescripLabel.text = pizzaDescription
        pizzaPriceLabel.text = pizzaPrice
  
    }
}
