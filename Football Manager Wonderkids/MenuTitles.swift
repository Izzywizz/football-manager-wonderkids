//
//  MenuTitles.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 28/02/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

enum MenuTitles: String {
    case Goalkeepers, Defenders, Midfielders, Forwards, Favourites
    
    var titles: [MenuTitles] {
        return [.Goalkeepers, .Defenders, .Midfielders, .Forwards, .Favourites]
    }
    
}

extension MenuTitles {
    
    var image: UIImage {
        switch self {
        case .Goalkeepers: return #imageLiteral(resourceName: "Goalkeepers")
        case .Defenders: return #imageLiteral(resourceName: "Defenders")
        default:
            return #imageLiteral(resourceName: "Defenders")
        }
    }
    
}
