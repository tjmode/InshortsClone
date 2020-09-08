//
//  DiscoverViewController.swift
//  InShorts Clone
//
//  Created by Sunitha Balasubramanian on 29/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    @IBOutlet weak var masterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        masterCollectionView.dataSource = self
        masterCollectionView.delegate = self
        navigationController?.isNavigationBarHidden = false
        title = "Discover"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: nil)
        let myFeedButton = UIBarButtonItem(title: "My Feed", style: .done, target: self, action: #selector(backToNewsFeed))
        myFeedButton.tintColor = .gray
        let backbutton = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: self, action: #selector(backToNewsFeed))
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.setCenteredPlaceHolder()
        navigationItem.hidesSearchBarWhenScrolling = false
        search.searchBar.placeholder = "Search for news"
        navigationItem.searchController = search
        navigationItem.rightBarButtonItems = [backbutton, myFeedButton]
        tabBarController?.tabBar.isHidden = true
    }
    
}
extension DiscoverViewController:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "masterCell", for: indexPath) as! DiscoverCollectionViewCell
        cell.setup()
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 1600)
    }
    
    @objc func backToNewsFeed() {
        let viewController = self.storyboard!.instantiateViewController(identifier: "mainVC") as! MyFeedViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
}
