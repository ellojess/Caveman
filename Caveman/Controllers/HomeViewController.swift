//
//  ViewController.swift
//  Caveman
//
//  Created by Bo on 3/12/20.
//  Copyright © 2020 Jessica Trinh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate{
    

    var collectionView: UICollectionView!
    
    lazy var sections: [Section] = [
        TitleSection(title: "Featured Categories"),
        FeaturedSection(),
        TitleSection(title: "Last Month's Favorites"),
        FavoriteSection()
    ]
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        setViews()
        setupCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setViews(){
        self.view.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        setNavigation()
        setupCollectionView()
    }
    
    func setNavigation(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = self.tabBarItem.title
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func setupCollectionView(){
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: "FeaturedCell")
        collectionView.register(TitleCell.self, forCellWithReuseIdentifier: "TitleCell")

        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.reloadData()
    }    
}


extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
        
    }
}
