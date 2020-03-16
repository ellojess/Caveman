//
//  ProfileViewController.swift
//  Caveman
//
//  Created by Bo on 3/15/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        print("profileVC")
    }
    
    override func loadView() {
      super.loadView()
    }
    
    func setViews(){
        self.view.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
    }
    
}
