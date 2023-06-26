//
//  ViewController.swift
//  PizzaApp
//
//  Created by Mac on 6/22/23.
//

import UIKit

class MainVC: UIViewController {
    
    var pizzacategory = true
    
    
    let childMenu = ContactsVC()
    
    var saleData: [SaleModel] = []
    
    var saleCollectionHeigtConstraint: NSLayoutConstraint!
    var childTopConstraint: NSLayoutConstraint!
    

    lazy var saleTable: UICollectionView = {
        let table = UICollectionView(frame: .zero, collectionViewLayout: flowLayout())
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.showsHorizontalScrollIndicator = false
        table.register(SaleCell.self, forCellWithReuseIdentifier: SaleCell.indetifier)
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Пицца"
        setupView()
        
        DispatchQueue.main.async {
            self.saleData = saleDatas
            self.saleTable.reloadData()
        }
        
        let swipeGestureUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGestureUp.direction = .up
        childMenu.view.addGestureRecognizer(swipeGestureUp)
        
        
        
        
        let swipeGestureDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGestureDown.direction = .down
        //view.addGestureRecognizer(swipeGestureDown)
        childMenu.view.addGestureRecognizer(swipeGestureDown)

    }

    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {

        switch gesture.direction {
        case .up:

            childTopConstraint.constant = 0

            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                self.saleTable.transform = CGAffineTransform(scaleX: 0, y: 0)

            }) { done in
                if done {
                    self.saleTable.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }


        case .down:
            childTopConstraint.constant = 142
            saleTable.transform = CGAffineTransform.identity
            saleTable.isHidden = false
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                self.view.layoutIfNeeded()
            })
        default:
            break
        }
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let checker = childMenu.mycontrollers.first
        
        
        
        
        let offsetY = scrollView.contentOffset.y

        if offsetY > 0 {
            childTopConstraint.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                self.saleTable.transform = CGAffineTransform(scaleX: 0, y: 0)

            }) { done in
                if done {
                    self.saleTable.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }
        } else if offsetY < 0 {
            childTopConstraint.constant = 142
            saleTable.transform = CGAffineTransform.identity
            saleTable.isHidden = false

            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                self.saleTable.isHidden = false
                self.view.layoutIfNeeded()
            })

        }
    }
    
    
    
    
    func setupView() {
        
        addChild(childMenu)
        view.addSubview(childMenu.view)
        childMenu.didMove(toParent: self)
        childMenu.view.translatesAutoresizingMaskIntoConstraints = false


        view.addSubview(saleTable)
        
        NSLayoutConstraint.activate([
            saleTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            saleTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            saleTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            childMenu.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childMenu.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childMenu.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        saleCollectionHeigtConstraint = saleTable.heightAnchor.constraint(equalToConstant: 142)
        saleCollectionHeigtConstraint.isActive = true
        
        childTopConstraint = childMenu.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 142)
        childTopConstraint.isActive = true

    }

    

    
    func flowLayout() -> UICollectionViewFlowLayout {
        
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

}


extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return saleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCell.indetifier, for: indexPath) as! SaleCell
        cell.filloutSale(imageName: saleData[indexPath.row].image)
        return cell
    }
    

}




