//
//  PlayerTableViewCell.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 01/03/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    //MARK: - Properties
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var team: UILabel!
    @IBOutlet weak var positionView: UIView!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var favourite: UIImageView!
    
    //custom colour
    let goalkeeperColour = UIColor(red: 255.0/255.0, green: 1.0/255.0, blue: 91.0/255.0, alpha: 1.0)
    let defenderColour = UIColor(red: 5.0/255.0, green: 239.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    let midfielderColour = UIColor(red: 2.0/255.0, green: 254.0/255.0, blue: 135/255.0, alpha: 1.0)
    let forwardColour = UIColor(red: 234.0/255.0, green: 255.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
    
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
    
    func setPositionBackgroundColour(for player: Player) {
        //postion colours
        let positionType = player.returnPostion()
        
        switch positionType {
        case .goalkeeper:
            positionView.backgroundColor = goalkeeperColour
        case .defenders:
            positionView.backgroundColor = defenderColour
        case .midfielders:
            positionView.backgroundColor = midfielderColour
        case .forwards:
            positionView.backgroundColor = forwardColour
        default:
            positionView.backgroundColor = .white
        }
    }
    
    
    func setRatingColour(for player: Player) {
        
        if let rating = Int(player.rating) {
            
            //if this works add the red rating
            switch rating {
            case 70..<80:
                let borderColour = UIColor(red: 181.0/255.0, green: 171.0/255.0, blue: 37.0/255.0, alpha: 1.0).cgColor
                let yellowRatingColour = UIColor(red: 248.0/255.0, green: 231.0/255.0, blue: 28.0/255.0, alpha: 1.0)
                ratingView.backgroundColor = yellowRatingColour
                ViewHelper.drawBorders(for: [ratingView], withBorderColour: borderColour)
                
            case 0...69:
                let borderColour = UIColor(red: 163.0/255.0, green: 13.0/255.0, blue: 31.0/255.0, alpha: 1.0).cgColor
                let redRatingColour = UIColor(red: 255.0/255.0, green: 1.0/255.0, blue: 91.0/255.0, alpha: 1.0)
                ratingView.backgroundColor = redRatingColour
                ViewHelper.drawBorders(for: [ratingView], withBorderColour: borderColour)
                
            default:
                let borderColour = UIColor(red: 65.0/255.0, green: 117.0/255.0, blue: 5.0/255.0, alpha: 1.0).cgColor
                let greenRatingColour = UIColor(red: 173.0/255.0, green: 247.0/255.0, blue: 182.0/255.0, alpha: 1.0)
                ratingView.backgroundColor = greenRatingColour
                ViewHelper.drawBorders(for: [ratingView], withBorderColour: borderColour)
            }
        }
    }

    func setPositionNamingConvention(player: Player) {
        
        guard
            let firstPosition = player.position.split(separator: ",").first,
            let lastPosition = player.position.split(separator: ",").last
            else { return }
        
        if player.returnPostion() == .midfielders {
            position.text = String(firstPosition)
        } else if player.returnPostion() == .forwards {
            position.text = String(lastPosition)
        } else {
            position.text = String(firstPosition)
        }
    }
    
    func setNames(for player: Player) {
        guard
            let lastName = player.name.split(separator: ",").first,
            let firstname = player.name.split(separator: ",").last
        else { return }
        
        if firstname == lastName {
            playerName.text = "\(firstname)"
        } else {
            playerName.text = "\(lastName), \(firstname)"
        }
    }
    
    func configure(player: Player) {
        
        setPositionBackgroundColour(for: player)
        setRatingColour(for: player)
        setPositionNamingConvention(player: player)
        setNames(for: player)
        
        team.text = player.team
        value.text = "\(player.value) mil"
        rating.text = player.rating
        
        if player.isFavourite {
            favourite.image = #imageLiteral(resourceName: "Favourites")
        } else {
            favourite.image = #imageLiteral(resourceName: "noHeart")
        }
    }
    
}
