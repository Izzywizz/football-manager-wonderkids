//
//  SortingTableViewCell.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 01/03/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

class SortingTableViewCell: UITableViewCell {

    //Mark:- Properties
    @IBOutlet weak var position: UIButton!
    @IBOutlet weak var name: UIButton!
    @IBOutlet weak var price: UIButton!
    @IBOutlet weak var rating: UIButton!
    var buttonArray: [UIButton] = [UIButton]() // Empty UIButton array
    let customPurple = UIColor(red: 56.0/255.0, green: 0.0/255.0, blue: 61.0/255.0, alpha: 1.0)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let views = [position, name, price, rating] as! [UIView]
        ViewHelper.drawBorders(for: views)
        ViewHelper.roundedCorners(for: views)
        buttonArray = [position, name, price, rating]
        setupButtons()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sortAction(_ sender: UIButton, forEvent event: UIEvent) {
        let sortType = Sort(rawValue: sender.tag)!

        switch sortType {
        case .position:
            offSelectedButtonState()
            sender.isSelected = !sender.isSelected
        case .name:
            offSelectedButtonState()
            sender.isSelected = !sender.isSelected
        case .rating:
            offSelectedButtonState()
            sender.isSelected = !sender.isSelected
        case .price:
            offSelectedButtonState()
            sender.isSelected = !sender.isSelected
        }
        
        //determins the background colour of the button, giving the illusion that the other buttons have not been selected and changes its colours
        for button in buttonArray {
            if button.isSelected != true {
                button.backgroundColor = UIColor.white //unselect colours
            } else {
                button.backgroundColor = customPurple //this is the selection colour
            }
        }
    }
    
    func offSelectedButtonState() {
        for button in buttonArray {
            if button.isSelected == true {
                button.isSelected = false
            }
        }
    }
    
    func setupButtons() {
        
        //set normal image
        position.setTitleColor(customPurple, for: .normal)
        name.setTitleColor(customPurple, for: .normal)
        price.setTitleColor(customPurple, for: .normal)
        rating.setTitleColor(customPurple, for: .normal)
        
        //set highlighted image
        position.setTitleColor(.white, for: .selected)
        name.setTitleColor(.white, for: .selected)
        price.setTitleColor(.white, for: .selected)
        rating.setTitleColor(.white, for: .selected)
    }
}

enum Sort: Int {
    case position = 0
    case name
    case price
    case rating
}







