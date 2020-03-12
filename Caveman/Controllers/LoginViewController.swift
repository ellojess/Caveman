//
//  LoginViewController.swift
//  Caveman
//
//  Created by Bo on 3/12/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController{
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "MarkerFelt-Wide", size: 60)
        title.text = "Petbox"
        title.textColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        title.textAlignment = .center
        return title
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "box"))
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    let loginBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        button.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let usernameTextField: UITextField = {
        let usernameTextField = UITextField()
        let bottomLine = UIView()
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Username",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        usernameTextField.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        usernameTextField.textColor = .white
        usernameTextField.borderStyle = .none
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .white
        usernameTextField.addSubview(bottomLine)
        bottomLine.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: -8).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true

        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        return usernameTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        let bottomLine = UIView()
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        passwordTextField.textColor = .white
        passwordTextField.borderStyle = .none
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .white
        passwordTextField.addSubview(bottomLine)
        bottomLine.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -8).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    let box: UIImageView = {
        let box = UIImageView(image: UIImage(named: "box"))
        return box
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setViews()
    }
    
    func setViews(){
        
        self.view.addSubview(stackView)
        stackView.distribution = .fill
        stackView.widthAnchor.constraint(equalTo: self.view.layoutMarginsGuide.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.heightAnchor, multiplier: 0.50).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        self.view.backgroundColor = UIColor(red:0.44, green:0.40, blue:1.00, alpha:1.0)
        
        stackView.addArrangedSubview(titleLabel)
        
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        stackView.addArrangedSubview(box)
        box.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        stackView.addArrangedSubview(usernameTextField)
        
        usernameTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.addArrangedSubview(loginBtn)
        
        loginBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginBtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
    }
    
    
    @objc func loginButtonTapped(){
        print("logged in")
    }
    
    
}

