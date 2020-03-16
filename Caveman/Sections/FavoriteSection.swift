//
//  FavoriteSection.swift
//  Caveman
//
//  Created by Bo on 3/14/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

struct FavoriteSection: Section {
    
    var numberOfItems: Int = 3
    
    let data = [
        Cell(title: "Mr Artsy Fartsy", image: UIImage(named: "artistman")!),
        Cell(title: "Sir Activity", image: UIImage(named: "workoutman")!),
        Cell(title: "Happy Feet", image: UIImage(named: "dancingman")!)
    ]
    
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.35))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
                collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeaturedCell.self), for: indexPath)
                
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCell", for: indexPath) as! FeaturedCell
        cell.backgroundColor = UIColor(red:0.49, green:0.84, blue:0.87, alpha:1.0)
        //rgb(255, 121, 121), rgb(255, 190, 118), rgb(149, 175, 192), rgb(126, 214, 223)
        // rgb to uicolor converter https://www.uicolor.xyz/#/rgb-to-ui
        cell.layer.cornerRadius = 10
        cell.data = self.data[indexPath.row]
        return cell
    }
    
//    func <#fields#>
}

