//
//  PastCell.swift
//  Caveman
//
//  Created by Bo on 3/15/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

class PastCell: UITableViewCell {
    
    static var identifier = "PastCell"
        
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "AvenirNext-Bold", size: 20)
        title.textColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let itemImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "box2")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "unfavorite"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85).isActive = true
        stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(itemImage)
        itemImage.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.25).isActive = true
        
        stackView.addArrangedSubview(title)
        title.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.55).isActive = true
        title.textAlignment = .center
        
        stackView.addArrangedSubview(favoriteButton)
        favoriteButton.isHidden = false //hello hello testing here
        favoriteButton.isUserInteractionEnabled = true
        favoriteButton.addTarget(self, action: #selector(favTapped), for: .touchDown)
        
    }
    
    func setCellContents(item: Item){
        itemImage.image = item.image
        title.text = item.title
    }
    
    func setBoxContents(box: Box){
        textLabel?.text = box.title
        imageView?.image = box.image
    }
    
    @objc func favTapped(){
        if self.favoriteButton.currentImage == UIImage(named: "unfavorite"){
            
            UIView.animate(withDuration: 0.3,
            animations: {
                self.favoriteButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.favoriteButton.transform = CGAffineTransform.identity
                }
            })
            
            self.favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        }else{
            self.favoriteButton.setImage(UIImage(named: "unfavorite"), for: .normal)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
