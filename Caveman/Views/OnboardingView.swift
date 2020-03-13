//
//  OnboardingView.swift
//  Caveman
//
//  Created by Bo on 3/12/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

class OnboardingView: UIView {
    
    var isLastPage: Bool!
    var color: UIColor!
    var image: UIImage!
    var headerText: String!
    var bodyText: String!

    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "Helvetica Neue Bold", size: 30)
        headerLabel.textColor = .brown
        return headerLabel
    }()
    
    let bodyLabel: UILabel = {
        let bodyLabel = UILabel()
        bodyLabel.textAlignment = .center
        bodyLabel.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        bodyLabel.textColor = UIColor(red:1.00, green:0.98, blue:0.99, alpha:1.0)
        bodyLabel.lineBreakMode = .byWordWrapping
        bodyLabel.numberOfLines = 0
        return bodyLabel
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        button.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    //Initializer for a screen
    required init(color: UIColor, image: UIImage, headerText: String, bodyText: String, isLastPage: Bool = false) {
        super.init(frame: .zero)
        self.color = color
        self.image = image
        self.headerText = headerText
        self.bodyText = bodyText
        self.isLastPage = isLastPage
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func createStackView(){
        
        addSubview(stackView)

        stackView.distribution = .fill
        stackView.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, multiplier: 0.65).isActive = true

        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView .centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.stackView.addArrangedSubview(bodyLabel)
        self.stackView.addArrangedSubview(imageView)

        imageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 50).isActive = true
        
        bodyLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        stackView.addArrangedSubview(continueButton)
        
        continueButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        continueButton.isHidden = true
        if isLastPage {
            continueButton.isHidden = false
        }
    }

    func setColor(){
        self.backgroundColor = color
    }
    
    func setImage(){
        self.imageView.image = image
    }
    
    func setBody(){
        self.bodyLabel.text = bodyText
    }
    
    func setup() {
        createStackView()
        setColor()
        setImage()
        setBody()
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

