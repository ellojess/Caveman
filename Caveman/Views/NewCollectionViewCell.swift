//
//  NewCollectionViewCell.swift
//  Caveman
//
//  Created by Bo on 3/16/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "newOrderCell"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.image.contentMode = .scaleAspectFit
    }
    
    public func setUp(with model: New) {
        image.image = model.image
        title.text = model.title
    }

}

// layout grid for new order cells
class NewGridLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
        
        self.sectionInset = UIEdgeInsets(top: 10, left: 3, bottom: 15, right: 3)
        self.sectionInsetReference = .fromSafeArea
        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        let minColumnWidth = CGFloat(125)
        let maxNumColumns = Int(availableWidth/minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: 250)
    }
    
}

