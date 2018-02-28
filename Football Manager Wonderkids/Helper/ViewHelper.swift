//
//  ViewHelper.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 28/02/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

struct ViewHelper {
    /**
     This method makes sure that the views have a nice round corner to it, mostly used for TextViews in order to match the designs.
     - parameter views: an array of subclasses of UIView which would include most views we want to be rounded, ie TextView/ Labels/ TextField
     */
    static func roundedCorners(for views: [UIView], with cornerRadiusValue: CGFloat = 5.0) {
        for view in views {
            view.layer.cornerRadius = cornerRadiusValue
        }
    }
}
