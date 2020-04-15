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

    var currentOrder: Box!
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        return tableView
        }()
    
    func getItems() {
    // list of items
    let artistman = Item(title: "Mr Artsy Fartsy", image: UIImage(named: "artistman")!)
    let workoutman = Item(title: "Sir Activity", image: UIImage(named: "workoutman")!)
    let dancingman = Item(title: "Happy Feet", image: UIImage(named: "dancingman")!)
    let singingman = Item(title: "Saint Jolly", image: UIImage(named: "singingman")!)
    let bathman = Item(title: "Lax Man", image: UIImage(named: "bathman")!)
    let thumbsupman = Item(title: "Monsieur Supportive", image: UIImage(named: "thumbsupman")!)
    let confusedspaceman = Item(title: "Stargazer", image: UIImage(named: "confusedspaceman")!)
    let santaman = Item(title: "Holiday Sweetie", image: UIImage(named: "santaman")!)
    
    
    let boxesArray = [Box(title: "March 2020", items: [bathman, singingman], image: UIImage(named: "box2")!),
                      Box(title: "Febuary 2020", items: [workoutman, singingman, thumbsupman], image: UIImage(named: "box2")!),
                      Box(title: "January 2020", items: [confusedspaceman, bathman], image: UIImage(named: "box2")!),
                      Box(title: "December 2019", items: [santaman, dancingman, artistman], image: UIImage(named: "box2")!)]
        
        for box in boxesArray {
            orders.append(box)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setUpNavBar()
        setUpTableView()
        tableView.register(PastCell.self, forCellReuseIdentifier: "PastCell")
        getItems()
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
        tableView.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension PastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PastCell", for: indexPath) as! PastCell
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.textLabel?.text = "\(orders[indexPath.row].title)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = "\(indexPath.row) \(orders[indexPath.row].title)"
        cell.favoriteButton.isHidden = true
    
        cell.setBoxContents(box: orders[indexPath.row])
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected!")
        let nextVC: PastBoxViewController = PastBoxViewController()
        nextVC.currentOrder = orders[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
