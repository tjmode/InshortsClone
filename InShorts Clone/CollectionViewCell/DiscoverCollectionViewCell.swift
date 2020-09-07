//
//  DiscoverCollectionViewCell.swift
//  InShorts Clone
//
//  Created by Sunitha Balasubramanian on 29/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    var SelectedItemIndexPath = -1
    @IBOutlet weak var headerCollectionview: UICollectionView!
    @IBOutlet weak var bodyCollectionView: UICollectionView!
    @IBOutlet weak var footerCollectionView: UICollectionView!
    let headerImageArray = ["Poll","insights"]
    let footerImageArray = [
                            "Coronavirus",
                            "India",
                            "Business",
                            "Politics",
                            "Sports",
                            "Technology",
                            "Startups",
                            "Entertainment",
                            "Hatke",
                            "International",
                            "Automobile",
                            "Science",
                            "Travel",
                            "Others",
                            "Fashion",
                            "Education"]
    let bodyImageArray = [
                            "ALL NEWS",
                            "TRENDING",
                            "BOOKMARKS",
                            "UNREAD"]
    func setup() {
        headerCollectionview.delegate = self
        headerCollectionview.dataSource = self
        bodyCollectionView.delegate = self
        bodyCollectionView.dataSource = self
        footerCollectionView.delegate = self
        footerCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == headerCollectionview {
            return headerImageArray.count
        }
        else if collectionView == bodyCollectionView {
            return bodyImageArray.count
        } else if collectionView == footerCollectionView {
            return footerImageArray.count
        }
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionview {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCollectionViewCell
            item.headerImageView.image = UIImage(named: headerImageArray[indexPath.item])
        return item
        }
        else if collectionView == bodyCollectionView {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyCell", for: indexPath) as! BodyCollectionViewCell
            item.bodyImage.image = UIImage(named: bodyImageArray[indexPath.item])
            item.bodyLabel.text = bodyImageArray[indexPath.item]
            return item
            
        } else if collectionView == footerCollectionView {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: "FooterCell", for: indexPath) as! FooterCollectionViewCell
            item.footerImageView.image = UIImage(named: footerImageArray[indexPath.item])
            item.footerLabel.text = footerImageArray[indexPath.item]
            return item
        }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         if collectionView == headerCollectionview {
            return CGSize(width: 250, height: 150)
        }
        else if collectionView == bodyCollectionView {
            return CGSize(width: 105, height: 128)
         } else if collectionView == footerCollectionView {
            let widthCollection = collectionView.bounds.width / 3.2
            return CGSize(width: widthCollection , height: 170)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if SelectedItemIndexPath != -1 {
            if let cell = collectionView.cellForItem(at: [0, SelectedItemIndexPath]) as? BodyCollectionViewCell {
                cell.bodyLabel.textColor = .gray
            }
        }
        if let cell = collectionView.cellForItem(at: indexPath) as? BodyCollectionViewCell {
            cell.bodyLabel.textColor = UIColor.link
            SelectedItemIndexPath = indexPath[1]
        }
    }
    
}
