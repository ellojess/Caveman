//
//  PastViewController.swift
//  Caveman
//
//  Created by Bo on 3/15/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

class PastViewController: UIViewController, UITableViewDelegate{
    
    let tableView =  UITableView()
    
    let boxesArray = [Box(title: "March 2020", image: UIImage(named: "box2")!), Box(title: "Febuary 2020", image: UIImage(named: "box2")!), Box(title: "January 2020", image: UIImage(named: "box2")!), Box(title: "December 2019", image: UIImage(named: "box2")!), Box(title: "November 2019", image: UIImage(named: "box2")!), Box(title: "October 2019", image: UIImage(named: "box2")!), Box(title: "September 2019", image: UIImage(named: "box2")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setUpNavBar()
        setUpTableView()
        tableView.register(PastCell.self, forCellReuseIdentifier: "PastCell")
    }
    
    override func loadView() {
      super.loadView()
    }
    
    func setViews(){
        self.view.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
    }
    
    func setUpNavBar(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = self.tabBarItem.title
    }
    
    func setUpTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.backgroundColor = UIColor(red:1.0, green:1.0, blue:0.95, alpha:1.0)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}


extension PastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PastCell", for: indexPath) as! PastCell
//        cell.setCellContents(box: boxesArray[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
      return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected!")
    }
}