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
    
    
    
    //Find specifc areas on the pitch: Midfielders/ Forwards etc.
    func findGoalkeepers() -> [Player] {
        var localPlayers = [Player]()
        
        for player in players {
            if player.position.contains("GK") {
                localPlayers.append(player)
            }
        }
        
        return localPlayers
    }
    
    func findDefenders() -> [Player] {
        var localPlayers = [Player]()
        
        for player in players {
            
            if player.position.contains("DLC") || player.position.contains("DC") || player.position.contains("DRLC") || player.position.contains("D/WB/") || player.position.contains("D/WB") || player.position.contains("DL") || player.position.contains("DR") || player.position.contains("DRL") || player.position.contains("DRC") || player.position.contains("SW") || player.position.contains("DRK") {
                localPlayers.append(player)
            }
        }
        
        return localPlayers
    }
    
    
    func findMidfielders() -> [Player] {
        var localPlayers = [Player]()
        
        for player in players {
            
            if player.position.contains("DM") || player.position.contains("MC") || player.position.contains("MR") || player.position.contains("ML") || player.position.contains("AM") {
                localPlayers.append(player)
            }
        }
            return localPlayers
        
    }
    
    func findForwards() -> [Player] {
        var localPlayers = [Player]()
        
        for player in players {
            
            if player.position.contains("ST") || player.position.contains("AMR") || player.position.contains("AML") {
                localPlayers.append(player)
            }
        }
        return localPlayers
        
    }
        
        
        func filter(on filterParameter: MenuTitle) -> [Player] {
            switch filterParameter {
            case .Goalkeepers:
                return findGoalkeepers()
            case .Defenders:
                return findDefenders()
            case .Midfielders:
                return findMidfielders()
            case .Forwards:
                return findForwards()
            default:
                return [Player]()
            }
        }
        
}


