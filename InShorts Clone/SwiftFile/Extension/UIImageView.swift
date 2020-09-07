//
//  UIImageView.swift
//  
//
//  Created by Tonywilson Jesuraj on 07/09/20.
//
import UIKit
extension UIImageView {
    func downloadImage(url: String) {
        guard let urlRequest = URL(string: url) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlRequest) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
