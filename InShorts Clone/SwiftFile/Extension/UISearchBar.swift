//
//  UISearchBa.swift
//  InShorts Clone
//
//  Created by Tonywilson Jesuraj on 07/09/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

extension UISearchBar {
    func setCenteredPlaceHolder() {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        let searchBarWidth = self.frame.width / 2
        let placeholderIconWidth = textFieldInsideSearchBar?.leftView?.frame.width
        let placeHolderWidth = textFieldInsideSearchBar?.attributedPlaceholder?.size().width
        let offsetIconToPlaceholder: CGFloat = 8
        let placeHolderWithIcon = placeholderIconWidth! + offsetIconToPlaceholder
        let offset = UIOffset(horizontal: ((searchBarWidth / 2) - (placeHolderWidth! / 2) - placeHolderWithIcon + 50), vertical: 0)
        self.setPositionAdjustment(offset, for: .search)
    }
}

