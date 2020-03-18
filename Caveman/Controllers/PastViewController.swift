//
//  PastViewController.swift
//  Caveman
//
//  Created by Bo on 3/15/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

// history tab page 
class PastViewController: UIViewController, UITableViewDelegate{
    
    var orders: [Box] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        return tableView
        }()
    
    let boxesArray = [Box(title: "March 2020", image: UIImage(named: "box2")!),
                      Box(title: "Febuary 2020", image: UIImage(named: "box2")!),
                      Box(title: "January 2020", image: UIImage(named: "box2")!),
                      Box(title: "December 2019", image: UIImage(named: "box2")!)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setUpNavBar()
        setUpTableView()
        tableView.register(PastCell.self, forCellReuseIdentifier: "PastCell")
        boxInfo()
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
        view.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.backgroundColor = UIColor(red:1.0, green:1.0, blue:0.95, alpha:1.0)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func boxInfo() {
        for box in boxesArray {
            orders.append(box)
        }
    }
    
}

extension PastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PastCell", for: indexPath) as! PastCell
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.textLabel?.text = "\(orders[indexPath.row].title)"
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected!")
        let detail: PastBoxViewController = PastBoxViewController()
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
