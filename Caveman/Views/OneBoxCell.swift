//
//  BoxCell.swift
//  Caveman
//
//  Created by Bo on 4/10/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class BoxCell: UITableViewCell {
    
    static var identifier = "BoxCell"
    
    let background : UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = .white
        return background
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //initializer for a cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
        
    }
    
    func setup() {
        
        self.contentView.addSubview(background)
        background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
    }
    
    // Adding custom content
    func setContents(box: Box) {
        textLabel?.text = box.title

        
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView?.widthAnchor.constraint(equalToConstant: 60).isActive = true
  
        imageView?.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        textLabel?.leadingAnchor.constraint(equalTo: imageView!.trailingAnchor, constant: 25).isActive = true
        
        
    }
    
    func setOneBox(item: Item) {
        
        textLabel?.text = item.title
        
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView?.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        imageView?.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        textLabel?.leadingAnchor.constraint(equalTo: imageView!.trailingAnchor, constant: 25).isActive = true
        
    }
    
    
}
