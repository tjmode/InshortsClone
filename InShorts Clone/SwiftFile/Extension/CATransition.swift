//
//  CATransition.swift
//  InShorts Clone
//
//  Created by Tonywilson Jesuraj on 07/09/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

extension CATransition {
    func pushViewControllerFromLeftSide() -> CATransition {
        self.duration = 1.3
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.reveal
        self.subtype = CATransitionSubtype.fromLeft
        return self
    }
}
