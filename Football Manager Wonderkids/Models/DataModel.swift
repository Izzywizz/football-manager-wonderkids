//
//  DataModel.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 27/02/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import Foundation

class DataModel {
    
    var players = [Player]()
    
    init() {
        importJSONSeedData()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePathMatters() -> URL {
        return documentsDirectory().appendingPathComponent("playerSeed.json")
    }
    
    func importJSONSeedData() {
        let jsonURL = Bundle.main.url(forResource: "playerSeed", withExtension: "json")!
        let jsonData = try! Data(contentsOf: jsonURL)
        let jsonArray = try! JSONSerialization.jsonObject(with: jsonData, options: [.allowFragments]) as! [[String: Any]]
        
        for element in jsonArray {
            if let player = Player(from: element) {
                players.append(player)
            }
        }
    }
    
    func findGoalkeepers() -> [Player] {
        var goalkeepers = [Player]()
        
        for player in players {
            if player.position.contains("GK") {
                goalkeepers.append(player)
            }
        }
        
        return goalkeepers
    }
    
    func filter(on filterParameter: MenuTitle) -> [Player] {
        switch filterParameter {
        case .Goalkeepers:
            return findGoalkeepers()
        default:
            return [Player]()
        }
    }
    
    
}
