//
//  OnboardingViewController.swift
//  Caveman
//
//  Created by Bo on 3/12/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate{
    
    var firstView: OnboardingView!
    var secondView: OnboardingView!
    var thirdView: OnboardingView!
    var numOfPages: [OnboardingView] = []
    
    let scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize.height = 1.0
        return scrollView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.5)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.49, green:0.84, blue:0.87, alpha:1.0)
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomViews()
        setViews()
        setPageControl()
    }
    
    func setViews(){
        navigationController?.navigationBar.isHidden = true
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    func setCustomViews(){
        firstView = OnboardingView(color: UIColor(red:1.00, green:0.59, blue:0.40, alpha:1.0), image: UIImage(named: "supportiveman")!, headerText: "A", bodyText: "Get a Man for Every Occasion")
        secondView = OnboardingView(color: UIColor(red:0.91, green:0.36, blue:0.62, alpha:1.0), image: UIImage(named: "santaman")!, headerText: "B", bodyText: "Bring Him Home for the Holiday")
        thirdView = OnboardingView(color: UIColor(red:0.44, green:0.40, blue:1.00, alpha:1.0), image: UIImage(named: "unicornman")!, headerText: "C..", bodyText: "Get Your Not-So Unicorn Today!", isLastPage: true)
        thirdView.continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)

        numOfPages = [firstView, secondView, thirdView]

        for page in numOfPages{
            stackView.addArrangedSubview(page)
            page.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        }
    }
    
    @objc func continueButtonTapped(){
        let loginViewController: LoginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func setPageControl(){
        pageControl.numberOfPages = numOfPages.count
        view.addSubview(pageControl)
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
         scrollView.contentOffset.y = 0 //disable vertical scrolling
        }
    }
}
