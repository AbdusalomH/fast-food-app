//
//  ProfileVC.swift
//  PizzaApp
//
//  Created by Mac on 6/22/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    var pizzacategory = true
    
    var saleItemsData: [SaleModel] = []
    var menuDetailsData: [String] = ["2","2","2","2","2","2"]
    var receviedMenuItemsData: [MenuDetailsModel]   = []
    
    
    var saleCollectionHeigtConstraint: NSLayoutConstraint!
    var menuItemsCollectionTopConstraints: NSLayoutConstraint!
    var menuDetailsCollectionTopConstraints: NSLayoutConstraint!
    

    lazy var saleItemsCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: saleItemsFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(SaleCell.self, forCellWithReuseIdentifier: SaleCell.indetifier)
        return collection
    }()
    
    
    lazy var menuItemsCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: menuItemsFlowlayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = #colorLiteral(red: 0.9514434934, green: 0.9609040618, blue: 0.9738582969, alpha: 1)
        collection.register(MenuItemsCell.self, forCellWithReuseIdentifier: MenuItemsCell.indentifier)
        return collection
    }()
    
    
    lazy var menuDetailsCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: menuDetailsFlowlayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(MenuDetailsCell.self, forCellWithReuseIdentifier: MenuDetailsCell.identifier)
        collection.isPagingEnabled = true
        collection.layer.cornerRadius = 15
        collection.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return collection
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9515056014, green: 0.9608363509, blue: 0.9781611562, alpha: 1)
        
        self.title = "Пицца"
        setupView()
        swipeConfigure()
        DispatchQueue.main.async {
            self.receviedMenuItemsData = menuData
            self.saleItemsData = saleDatas
            self.menuItemsCollection.reloadData()
            self.saleItemsCollection.reloadData()
        }
        
    }
    
    
    private func swipeConfigure() {
        let swipeGestureUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGestureUp.direction = .up
        view.addGestureRecognizer(swipeGestureUp)
        
        let swipeGestureDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGestureDown.direction = .down
        view.addGestureRecognizer(swipeGestureDown)
    }


    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {

        switch gesture.direction {
        case .up:

            menuItemsCollectionTopConstraints.constant = 0
            menuDetailsCollectionTopConstraints.constant = 45
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                self.saleItemsCollection.transform = CGAffineTransform(scaleX: 0, y: 0)

            }) { done in
                if done {
                    self.saleItemsCollection.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }


        case .down:
            
            menuItemsCollectionTopConstraints.constant = 154
            menuDetailsCollectionTopConstraints.constant = 200
            saleItemsCollection.transform = CGAffineTransform.identity
            saleItemsCollection.isHidden = false
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                self.view.layoutIfNeeded()
            })
        default:
            break
        }
    }

    
    
    func setupView() {

        view.addSubview(saleItemsCollection)
        view.addSubview(menuItemsCollection)
        view.addSubview(menuDetailsCollection)
        
        NSLayoutConstraint.activate([
            saleItemsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            saleItemsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            saleItemsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            menuItemsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuItemsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuItemsCollection.heightAnchor.constraint(equalToConstant: 45),
            
            menuDetailsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            menuDetailsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuDetailsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuDetailsCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        saleCollectionHeigtConstraint = saleItemsCollection.heightAnchor.constraint(equalToConstant: 142)
        saleCollectionHeigtConstraint.isActive = true
        
        menuItemsCollectionTopConstraints = menuItemsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 154)
        menuItemsCollectionTopConstraints.isActive = true
        
        menuDetailsCollectionTopConstraints = menuDetailsCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
        menuDetailsCollectionTopConstraints.isActive = true
    }

    

    //MARK: Flowlayout for collection tables
    func saleItemsFlowLayout() -> UICollectionViewFlowLayout {
        
        let width                        = view.bounds.width
        let padding:CGFloat              = 5
        let minimumItemSpacing:CGFloat   = 20
        let availableWidth               = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                    = availableWidth
        
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize              = CGSize(width: itemWidth, height: 125)
        flowLayout.scrollDirection       = .horizontal
        return flowLayout
    }
    
    func menuItemsFlowlayout() -> UICollectionViewFlowLayout {
        let padding:CGFloat              = 5
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize              = CGSize(width: 100, height: 35)
        flowLayout.scrollDirection       = .horizontal
        return flowLayout
    }
    
    
    func menuDetailsFlowlayout() -> UICollectionViewFlowLayout {
        
        let availableHeight              = view.bounds.height
        
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: 0, left: 0, bottom: 0 , right: 0)
        flowLayout.itemSize              = CGSize(width: view.bounds.width, height: availableHeight)
        flowLayout.scrollDirection       = .horizontal
        flowLayout.minimumLineSpacing    = 0
        return flowLayout
    }
}

//MARK: Extensions - Collection view delegate and datasource
extension ProfileVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case saleItemsCollection:
            return saleItemsData.count
        case menuDetailsCollection:
            return menuDetailsData.count
        case menuItemsCollection:
            return receviedMenuItemsData.count
        default:
            break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let cells = UICollectionViewCell()
        
        switch collectionView {
            
        case saleItemsCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCell.indetifier, for: indexPath) as! SaleCell
            cell.filloutSale(imageName: saleItemsData[indexPath.row].image)
            return cell
        
        case menuDetailsCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuDetailsCell.identifier, for: indexPath) as! MenuDetailsCell
            let colors: [UIColor] = [.red, .yellow, .black, .cyan, .white, .green]
            cell.backgroundColor = colors[indexPath.row]
            return cell
            
        case menuItemsCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemsCell.indentifier, for: indexPath) as! MenuItemsCell
            cell.getTitles(name: receviedMenuItemsData[indexPath.row].name, selected: receviedMenuItemsData[indexPath.row].selected)
                    let index = IndexPath(row: 0, section: 0)
                    menuItemsCollection.selectItem(at: index, animated: true, scrollPosition: .top)
            return cell
            
        default:
            break
        }
        return cells
    }
    
    func scrollToSelectedSection(row: Int) {
        
        let index = IndexPath(row: row, section: 0)
        menuDetailsCollection.isPagingEnabled = false
        menuDetailsCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch collectionView {
            
        case menuItemsCollection:
            if indexPath.row >= 0 {
                self.scrollToSelectedSection(row: indexPath.row)
                self.menuDetailsCollection.isPagingEnabled = true
            }
           
        case menuDetailsCollection:
            print("menuDetailsCollection 1234 ")

        default:
            break
        }
    }
}

