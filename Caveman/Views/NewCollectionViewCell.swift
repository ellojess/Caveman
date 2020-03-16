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
        // needs looking at
        title.text = model.title
    }

}
