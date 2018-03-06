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
    var currentPostionSelected: MenuTitle = .Goalkeepers
    
    init() {
        loadPlayers()
    }
    
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePathPlayers() -> URL {
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
    
    //save
    func savePlayers() {
        //        let jsonURLToBeSaved = dataFilePathPlayers()
        let encoder = JSONEncoder()
        let encodingJson = try! encoder.encode(players)
        try! encodingJson.write(to: dataFilePathPlayers())
        print("File: \(dataFilePathPlayers())")
    }
    
    //load
    func loadPlayers() {
        if let data = try? Data(contentsOf: dataFilePathPlayers()) {
            let decoder = JSONDecoder()
            guard let jsonArray = try? decoder.decode([Player].self, from: data) else { return }
            
            for player in jsonArray {
                let player = Player(name: player.name, age: player.age, team: player.team, position: player.position, rating: player.rating, weeklyWageInK: player.weeklyWageInK, value: player.value, isFavourite: player.isFavourite)
                players.append(player)
            }
            
            
        } else {
            //data empty
            importJSONSeedData()
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
            
            if player.position.contains("DLC") || player.position.contains("DC") || player.position.contains("DRLC") || player.position.contains("WB") || player.position.contains("DL") || player.position.contains("DR") || player.position.contains("DRL") || player.position.contains("DRC") || player.position.contains("SW") || player.position.contains("DRK") {
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
            
            if player.position.contains("ST") || player.position.contains("FC") {
                localPlayers.append(player)
            }
        }
        return localPlayers
    }
    
    func findFavourties() -> [Player] {
        var localPlayers = [Player]()
        
        for player in players {
            
            if player.isFavourite {
                localPlayers.append(player)
            }
        }
        return localPlayers
    }
    
    
    func filter(on filterParameter: MenuTitle) -> [Player] {
        switch filterParameter {
        case .Goalkeepers:
            currentPostionSelected = .Goalkeepers
            return findGoalkeepers()
        case .Defenders:
            currentPostionSelected = .Defenders
            return findDefenders()
        case .Midfielders:
            currentPostionSelected = .Midfielders
            return findMidfielders()
        case .Forwards:
            currentPostionSelected = .Forwards
            return findForwards()
        case .Favourites:
            currentPostionSelected = .Favourites
            return findFavourties()
        }
    }
    
}


