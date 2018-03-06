//
//  MenuTitles.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 28/02/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

enum Position: String {
    case goalkeepers, defenders, midfielders, forwards, favourites
    
    var titles: [Position] {
        return [.goalkeepers, .defenders, .midfielders, .forwards, .favourites]
    }
}

extension Position {
    
    var image: UIImage {
        switch self {
        case .goalkeepers: return #imageLiteral(resourceName: "Goalkeepers")
        case .defenders: return #imageLiteral(resourceName: "Defenders")
        case .midfielders: return #imageLiteral(resourceName: "Midfielders")
        case .forwards: return #imageLiteral(resourceName: "Forwards")
        default:
            return #imageLiteral(resourceName: "Favourites")
        }
    }
    
}
