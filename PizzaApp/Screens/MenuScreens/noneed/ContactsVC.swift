//
//  ContactsVC.swift
//  PizzaApp
//
//  Created by Mac on 6/22/23.
//

import UIKit

class ContactsVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    
    
    let mycontrollers: [UIViewController] = [PizzaVC(), ComboVC(), DesertsVC(), JuicesVC()]


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        self.setViewControllers([PizzaVC()], direction: .forward, animated: true)
    }
    


    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = mycontrollers.firstIndex(of: viewController), index > 0 {
            let before = index - 1
            return mycontrollers[before]
        }
        return mycontrollers.last
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = mycontrollers.firstIndex(of: viewController), index < mycontrollers.count - 1 {
            let next = index + 1
            return mycontrollers[next]
        }
        return mycontrollers.first
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

