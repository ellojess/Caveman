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
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont(name: "MarkerFelt-Wide", size: 27)
        title.text = "On deMANd"
        title.textColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        title.textAlignment = .center
        return title
    }()
    
    let manImageView: UIImageView = {
        let manImageView = UIImageView(image: UIImage(named: "deadbunnyman"))
        manImageView.contentMode = .scaleAspectFit
        manImageView.translatesAutoresizingMaskIntoConstraints = false
        return manImageView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 18)
        button.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
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
        bottomLine.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: -10).isActive = true
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
    
    let man: UIImageView = {
        let man = UIImageView(image: UIImage(named: "deadbunnyman"))
        return man
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setViews()
    }
    
    func setViews(){
        
        view.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.73).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        self.view.backgroundColor = UIColor(red:0.44, green:0.40, blue:1.00, alpha:1.0)
        
        stackView.addArrangedSubview(titleLabel)
        
        titleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        stackView.addArrangedSubview(man)
        man.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        stackView.addArrangedSubview(usernameTextField)
        
        usernameTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.addArrangedSubview(loginButton)
        
        loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // TODO: Animate title label

//    @objc func continueButtonTapped(){
//        print("continue")
//        let loginViewController: LoginViewController = LoginViewController()
//        self.navigationController?.pushViewController(loginViewController, animated: true)
//    }
    
    @objc func loginButtonTapped(){
        print("login pressed")
        let homeViewController: HomeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    
}

