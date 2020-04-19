//
//  TabBarController.swift
//  Caveman
//
//  Created by Bo on 3/15/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class TabBarController: UITabBarController, UITabBarControllerDelegate{
    
    var firstItemImageView: UIImageView!
    var secondItemImageView: UIImageView!
    var thirdItemImageView: UIImageView!
    var fourthItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        setupTabBarIcons()
        self.delegate = self
        self.tabBar.tintColor = UIColor(red:0.49, green:0.84, blue:0.87, alpha:1.0)

    }
    
    func setupViewControllers(){
                
        let homeVC = HomeViewController()
        let navController = UINavigationController(rootViewController:homeVC)
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "tab-home"), tag: 0)
        
        
        let newBoxVC = NewViewController()
        let navController2 = UINavigationController(rootViewController:newBoxVC)
        newBoxVC.tabBarItem = UITabBarItem(title: "New", image: UIImage(named: "tab-box"), tag: 1)
        
        let pastBoxesVC = PastViewController()
        let navController3 = UINavigationController(rootViewController:pastBoxesVC)
        pastBoxesVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(named: "tab-history"), tag: 2)
        
        
        let profileVC = ContentView()
        let navController4 = UIHostingController(rootView: profileVC)
        navController4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "tab-profile"), tag: 3)
        
        viewControllers = [navController, navController2, navController3, navController4]
    
    }
    
    func setupTabBarIcons(){
        
        let firstItemView = self.tabBar.subviews[0]
        let secondItemView = self.tabBar.subviews[1]
        let thirdItemView = self.tabBar.subviews[2]
        let fourthItemView = self.tabBar.subviews[3]
        
        self.firstItemImageView = (firstItemView.subviews.first as! UIImageView)
        self.firstItemImageView.contentMode = .center
        
        self.secondItemImageView = (secondItemView.subviews.first as! UIImageView)
        self.secondItemImageView.contentMode = .center
        
        self.thirdItemImageView = (thirdItemView.subviews.first as! UIImageView)
        self.thirdItemImageView.contentMode = .center
        
        self.fourthItemImageView = (fourthItemView.subviews.first as! UIImageView)
        self.fourthItemImageView.contentMode = .center
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected a new view controller")

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0{
            firstItemImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.firstItemImageView.transform = .identity
            }, completion: nil)
        }else if item.tag == 1{
            secondItemImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.secondItemImageView.transform = .identity
            }, completion: nil)
        }else if item.tag == 2{
            thirdItemImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.thirdItemImageView.transform = .identity
            }, completion: nil)
        }else if item.tag == 3{
            fourthItemImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.fourthItemImageView.transform = .identity
            }, completion: nil)
        }
    }
}


