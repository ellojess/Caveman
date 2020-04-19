//
//  FeaturedSection.swift
//  Caveman
//
//  Created by Bo on 3/14/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

struct FeaturedSection: Section {
    
    var numberOfItems: Int = 5
    
    let data = [
        Cell(title: "Mr Artsy Fartsy", image: UIImage(named: "artistman")!),
        Cell(title: "Sir Activity", image: UIImage(named: "workoutman")!),
        Cell(title: "Happy Feet", image: UIImage(named: "dancingman")!),
        Cell(title: "Saint Jolly", image: UIImage(named: "singingman")!),
        Cell(title: "Lax Man", image: UIImage(named: "bathman")!),
        Cell(title: "Monsieur Supportive", image: UIImage(named: "thumbsupman")!),
        Cell(title: "Stargazer", image: UIImage(named: "confusedspaceman")!)
    ]
    
        
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(300))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeaturedCell.self), for: indexPath)
                
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCell", for: indexPath) as! FeaturedCell
        cell.backgroundColor = UIColor(red:1.00, green:0.59, blue:0.40, alpha:1.0)
        cell.layer.cornerRadius = 10
        cell.data = self.data[indexPath.row]
        return cell
    }
}

// rgb to uicolor converter https://www.uicolor.xyz/#/rgb-to-ui
