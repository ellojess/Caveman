//
//  FeaturedSection.swift
//  Caveman
//
//  Created by Bo on 3/14/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation

struct FeaturedSection: Section {
    var numberOfItems: Int = 4
    let images = ["artistman", "workoutman", "dancingman", "singingman", "bathman", "thumbsupman"]
    let headings = ["Artsy", "Active", "Happy Feet", "Serendipitous", "Spa Man", "Supportive"]
    
    
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
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.identifier, for: indexPath) as! FeaturedCell
//        cell.imgView.image = UIImage(named: images[indexPath.row])
//        cell.textLabel.text = texts[indexPath.row]
        return cell
    }
    
    
}
