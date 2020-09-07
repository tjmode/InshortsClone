//
//  UIView+Extension.swift
//  MVVM
//
//  Created by Karthikeyan T on 31/12/2019.
//  Copyright © 2019 Karthikeyan T. All rights reserved.
//

import UIKit.UIView



@IBDesignable
class CardView: UIView {
    
    @IBInspectable var borderColor: UIColor? = UIColor.gray
    @IBInspectable var cornerRadius: CGFloat    = 10
    @IBInspectable var shadowOffsetWidth: Int   = 2
    @IBInspectable var shadowOffsetHeight: Int  = 3
    @IBInspectable var shadowColor: UIColor?    = UIColor.gray
    @IBInspectable var shadowOpacity: Float     = 0.5
    
    override func layoutSubviews() {
        self.backgroundColor = .white
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.7
        self.layer.borderColor = borderColor?.cgColor 
        self.layer.borderWidth = 1
    }
}
