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
    
    /**
     Ensures that the views related to the textfields have a border and colour applied to them by default, recall that textfields are just views
     - parameter views: an Array of subclasses of UIView so TextFields, TableViewCells etc
     */
    static func drawBorders(for views: [UIView])   {
        
        let borderColour = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        for view in views {
            view.layer.borderWidth = 1
            view.layer.borderColor = borderColour
        }
    }
}
