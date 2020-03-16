//
//  FavoritesCell.swift
//  Caveman
//
//  Created by Bo on 3/15/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    
    static var identifier: String = "FavoritesCell"
    
    @IBOutlet weak var manImage: UIImageView!
    @IBOutlet weak var manLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        manImage.layer.cornerRadius = 10
        manLabel.text = ""
    }

}
