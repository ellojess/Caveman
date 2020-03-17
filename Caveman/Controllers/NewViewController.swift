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
        
        let flow = NewGridLayout()
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flow)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
        collectionView.alwaysBounceVertical = true
        
        //Register cell
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "NewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "newOrderCell")
        collectionView.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:0.0)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        navigationItem.title = "Order a New Beau"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newOrderCell", for: indexPath) as! NewCollectionViewCell
        
        if indexPath == selectedIndexPath{
            cell.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        }else{
            cell.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.5)
        }
        
        cell.setUp(with: data[indexPath.row])
        return cell
    }
    
}
