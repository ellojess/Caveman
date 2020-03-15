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

class TabBarController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupViewControllers() {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        let homeNav = UINavigationController(rootViewController: homeVC)
        
//        viewControllers = [homeNav]
    }
}
