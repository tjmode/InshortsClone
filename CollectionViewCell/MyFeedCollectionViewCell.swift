//
//  CollectionViewCell.swift
//  InShorts Clone
//
//  Created by Sunitha Balasubramanian on 28/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit
import Gemini

class MyFeedCollectionViewCell: GeminiCell {
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var newsHeadingLabel: UILabel!
    @IBOutlet weak var newsUIView: UIView!
    
    func configure(with viewModel: MyFeedModel) {
        self.newsDescriptionLabel.text = viewModel.desc
        self.headerImageView.downloadImage(url: viewModel.imgURL ?? "")
        self.newsHeadingLabel.text = viewModel.headLines
    }
}
