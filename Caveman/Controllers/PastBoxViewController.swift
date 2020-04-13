//
//  PastBoxViewController.swift
//  Caveman
//
//  Created by Bo on 3/17/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

// view for single box items 
class PastBoxViewController: UIViewController, UITableViewDelegate {
    var boxMonth: String = ""
    
    var currentOrder: Box!
    
    var orders: [Box] = []
    
    var boxItems: [Item] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        return tableView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpTableView()
    }
    
    func setUpTableView(){
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.backgroundColor = .white
        
        tableView.delegate = self
//        tableView.dataSource = self
    }
    

}

//extension PastBoxViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return currentOrder.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "OneBoxCell", for: indexPath) as! OneBoxCell
//        cell.setCellContents(item: boxItems[indexPath.row])
//        return cell
//    }
    
    
//}
