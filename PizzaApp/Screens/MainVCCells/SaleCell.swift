//
//  SaleCell.swift
//  PizzaApp
//
//  Created by Mac on 6/23/23.
//

import UIKit

class SaleCell: UICollectionViewCell {
    
    static let indetifier = "salecell"
    
    lazy var saleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView() {
        contentView.addSubview(saleImage)
        
        NSLayoutConstraint.activate([
            
            saleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            saleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            saleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            saleImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    func filloutSale(imageName: String) {
        saleImage.image = UIImage(named: imageName)
    }
    
}
