//
//  PlayerTableViewCell.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 01/03/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var positionView: UIView!
    @IBOutlet weak var postion: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //this radius value will need to be changed if the view sizes change, divide the view width/height by 2 then p[lace this number here
        ViewHelper.roundedCorners(for: [ratingView], withRadius: 17.0)
        ViewHelper.roundedCorners(for: [positionView])
        ViewHelper.drawBorders(for: [ratingView])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(player: Player) {
        if let firstPosition = player.position.split(separator: ",").last,
            let lastName = player.name.split(separator: ",").first,
            let firstname = player.name.split(separator: ",").last {
            
            postion.text = String(firstPosition)
            
            if firstname == lastName {
                playerName.text = "\(firstname)"
            } else {
                playerName.text = "\(lastName), \(firstname)"
            }

        }
        value.text = "\(player.value) mil"
        rating.text = player.rating
    }
    
}
