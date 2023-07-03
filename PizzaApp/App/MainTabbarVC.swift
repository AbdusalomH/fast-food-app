//
//  MainTabbarVC.swift
//  PizzaApp
//
//  Created by Mac on 6/22/23.
//

import UIKit

class MainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor         = #colorLiteral(red: 0.9912737012, green: 0.1047256812, blue: 0.3643145561, alpha: 1)
        //UINavigationBar.appearance().tintColor  = .systemGreen
        tabBar.backgroundColor = .white
        viewControllers                         = [profileVC(), contactsVC(), mainVC(), basketVC()]

    }
    
    func mainVC() -> UINavigationController {
    
        let mainVC = MainVC()
        mainVC.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "fork.knife"), tag: 0)
        return UINavigationController(rootViewController: mainVC)
    }
    
    
    func contactsVC() -> UINavigationController {
    
        let contactVC = ContactsVC()
        contactVC.tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(systemName: "person.3"), tag: 1)
        return UINavigationController(rootViewController: contactVC)
    }
    
    
    func profileVC() -> UINavigationController {
    
        let profileVC = ProfileVC()
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 2)
        //profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        return UINavigationController(rootViewController: profileVC)
    }
    
    
    func basketVC() -> UINavigationController {
    
        let basketVC = BasketVC()
        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "basket"), tag: 3)
        return UINavigationController(rootViewController: basketVC)
    }
}
