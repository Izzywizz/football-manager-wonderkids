//
//  Player.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 22/02/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import Foundation

class Player: Codable {
    var name: String
    var age: String
    var team: String
    var position: String
    var rating: String
    var weeklyWageInK: String
    var value: String
    var isFavourite: Bool
    
    struct Key {
        static let rating = "rating"
        static let position = "position"
        static let age = "age"
        static let nationality = "nationality"
        static let team = "team"
        static let weeklyWageInK = "weeklyWageInK"
        static let value = "value"
        static let name = "name"
        static let isFavourite = "isFavourite"
    }
    
    init(name: String, age: String, team: String, position: String, rating: String, weeklyWageInK: String, value: String, isFavourite: Bool) {
        self.name = name
        self.age = age
        self.team = team
        self.position = position
        self.rating = rating
        self.weeklyWageInK = weeklyWageInK
        self.value = value
        self.isFavourite = isFavourite
    }
    
    init?(from json: [String: Any]) {
        guard
            let name = json[Key.name] as? String,
            let team = json[Key.team] as? String,
            let age = json[Key.age] as? String,
            let position = json[Key.position] as? String,
            let rating = json[Key.rating] as? String,
            let weeklyWageInK = json[Key.weeklyWageInK] as? String,
            let value = json[Key.value] as? String,
            let isFavourite = json[Key.isFavourite] as? Bool
            
        else { return nil }
        
        self.name = name
        self.age = age
        self.team = team
        self.position = position
        self.rating = rating
        self.weeklyWageInK = weeklyWageInK
        self.value = value
        self.isFavourite = isFavourite
    }
}


