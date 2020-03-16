//
//  NewViewController.swift
//  Caveman
//
//  Created by Bo on 3/15/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var selectedIndexPath: IndexPath? {
           didSet {
               var indexPaths: [IndexPath] = []
               if let selectedIndexPath = selectedIndexPath {
                   indexPaths.append(selectedIndexPath)
               }
               if let oldValue = oldValue {
                   indexPaths.append(oldValue)
               }
               collectionView.performBatchUpdates({
                   self.collectionView.reloadItems(at: indexPaths)
               })
           }
       }
    
    var numberOfItems: Int = 5
    
    let data = [
        New(title: "Mr Artsy Fartsy", image: UIImage(named: "artistman")!),
        New(title: "Sir Activity", image: UIImage(named: "workoutman")!),
        New(title: "Happy Feet", image: UIImage(named: "dancingman")!),
        New(title: "Saint Jolly", image: UIImage(named: "singingman")!),
        New(title: "Lax Man", image: UIImage(named: "bathman")!),
        New(title: "Monsieur Supportive", image: UIImage(named: "thumbsupman")!),
        New(title: "Stargazer", image: UIImage(named: "confusedspaceman")!)
    ]
    
    lazy var collectionView: UICollectionView = {
        
        let flow = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flow)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
        // Customization
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        //Registering the cell
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NewCollectionViewCell.self, forCellWithReuseIdentifier: "newOrderCell")
        collectionView.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:0.0)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        navigationItem.title = "Order a New Beau"
//        self.navigationController?.navigationBar.prefersLargeTitles = true

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newOrderCell", for: indexPath) as! NewCollectionViewCell
        
        if indexPath == selectedIndexPath{
            cell.backgroundColor = #colorLiteral(red: 1, green: 0.5756825209, blue: 0.5681426525, alpha: 0.9445098459)
        }else{
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
        
        
        cell.setUp(with: data[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if selectedIndexPath == indexPath {
          selectedIndexPath = nil
        } else {
          selectedIndexPath = indexPath
        }
          return false
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        print("indexPath.row = ", indexPath.row)
//        // Find the current cell
//        let cell: NewboxesCell = collectionView.cellForItem(at: indexPath) as! NewboxesCell
//        print(cell)
//        cell.backgroundColor = #colorLiteral(red: 1, green: 0.5756825209, blue: 0.5681426525, alpha: 0.9445098459)
//    }
    
}


