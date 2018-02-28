//
//  MenuTableViewCell.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 27/02/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ViewHelper.roundedCorners(for: [view])        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // Mark: - Cell Configuration
    func configure( _ title: String, image: UIImage) {
        menuTitle.text = title
        menuImage.image = image
        
    }

}
