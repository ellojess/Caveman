//
//  FavoritesCell.swift
//  Caveman
//
//  Created by Bo on 3/15/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    
    var data: Fav? {
        didSet{
            guard let data = data else { return }
            image.image = data.image
            title.text = data.title
        }
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        return image
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor(red:1.00, green:0.59, blue:0.40, alpha:1.0)
        title.font = UIFont(name: "AvenirNext-Bold", size: 20)
        title.textAlignment = .center
        title.contentMode = .scaleAspectFit
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(stackView)
        contentView.addSubview(title)
        
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.80).isActive = true
        stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.70).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        stackView.addArrangedSubview(image)
        image.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.75).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
