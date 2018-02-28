//
//  MenuTitles.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 28/02/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

enum MenuTitle: String {
    case Goalkeepers, Defenders, Midfielders, Forwards, Favourites
    
    var titles: [MenuTitle] {
        return [.Goalkeepers, .Defenders, .Midfielders, .Forwards, .Favourites]
    }
}

extension MenuTitle {
    
    var image: UIImage {
        switch self {
        case .Goalkeepers: return #imageLiteral(resourceName: "Goalkeepers")
        case .Defenders: return #imageLiteral(resourceName: "Defenders")
        case .Midfielders: return #imageLiteral(resourceName: "Midfielders")
        case .Forwards: return #imageLiteral(resourceName: "Forwards")
        default:
            return #imageLiteral(resourceName: "Favourites")
        }
    }
    
}
