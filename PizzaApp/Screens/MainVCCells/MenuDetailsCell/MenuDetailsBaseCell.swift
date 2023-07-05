//
//  MenuDetailsCell.swift
//  PizzaApp
//
//  Created by Mac on 6/25/23.
//

import UIKit
import SDWebImage


protocol MenuDetailsCellDelegate: AnyObject {
    func didScrollUp(in cell: MenuDetailsBaseCell)
    func didScrollDown(in cell: MenuDetailsBaseCell)
}




class MenuDetailsBaseCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    

    weak var delegate: MenuDetailsCellDelegate?
        

    static let identifier = "menuDetailsCell"
    
    
    var menuDetails: [PizzaModel2] = []
    
    
    
    lazy var detailsCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowlayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(DestailCollectionCell.self, forCellWithReuseIdentifier: DestailCollectionCell.identifier)
        return collection
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        getMenuData()
        
    }
    
    func getMenuData() {
        NetworkManager.shared.requestDataFromServer(name: "") { result in
            switch result {
            case .success(let data):
                self.menuDetails = data
                DispatchQueue.main.async {
                    self.detailsCollection.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func flowlayout() -> UICollectionViewFlowLayout {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        flowlayout.itemSize = CGSize(width: contentView.frame.width - 40, height: 200)
        flowlayout.scrollDirection = .vertical
        return flowlayout
    }
    
    func setupView() {
        contentView.addSubview(detailsCollection)
        
        NSLayoutConstraint.activate([
            detailsCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailsCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailsCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailsCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuDetails.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let receivedData = menuDetails[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestailCollectionCell.identifier, for: indexPath) as! DestailCollectionCell
        let price = receivedData.price.first!
        cell.filloutTable(imagename: receivedData.image, pizzaName: receivedData.title, pizzaDescription: receivedData.pizzaDescription, pizzaPrice: "от \(price) р")
        return cell
    }

}



class DestailCollectionCell: UICollectionViewCell {
    
    static let identifier = "destailCollectionCell"
    
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
    
    lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 1
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        contentView.addSubview(lineLabel)

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
            pizzaDescripLabel.bottomAnchor.constraint(equalTo: pizzaPriceLabel.topAnchor, constant: -12),
            
            lineLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineLabel.heightAnchor.constraint(equalToConstant: 2)
        ])

    }
    
    func filloutTable(imagename: String, pizzaName: String, pizzaDescription: String, pizzaPrice: String) {
        pizzaTitle.text = pizzaName
        pizzaDescripLabel.text = pizzaDescription
        pizzaPriceLabel.text = pizzaPrice
        
        pizzaImage.sd_setImage(with: URL(string: imagename), placeholderImage: UIImage(named: "placeholder"))
    }
}


extension MenuDetailsBaseCell {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > 100 {
            delegate?.didScrollDown(in: self)
        } else if scrollView.contentOffset.y < -80 {
            delegate?.didScrollUp(in: self)
        }
    }
}
