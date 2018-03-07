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
    var currentPostionSelected: Position = .goalkeeper
    
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
            print("Loading from data")
            let decoder = JSONDecoder()
            guard let jsonArray = try? decoder.decode([Player].self, from: data) else { return }
            
            for player in jsonArray {
                let player = Player(name: player.name, age: player.age, team: player.team, position: player.position, rating: player.rating, weeklyWageInK: player.weeklyWageInK, value: player.value, isFavourite: player.isFavourite)
                players.append(player)
            }
            
            
        } else {
            //data empty
            print("importing")
            importJSONSeedData()
        }
    }
    
    
    //Find specifc areas on the pitch: Midfielders/ Forwards etc.
    func findGoalkeepers() -> [Player] {
        var localPlayers = [Player]()
        
        for player in players {
            if player.returnPostion() == .goalkeeper {
                localPlayers.append(player)
            }
        }
        
        return localPlayers
    }
    
    func findDefenders() -> [Player] {
        var localPlayers = [Player]()
        
        for player in players {
            
            if player.returnPostion() == .defenders {
                localPlayers.append(player)
            }
        }
        
        return localPlayers
    }
    
    
    func findMidfielders() -> [Player] {
        var localPlayers = [Player]()
        
        for player in players {
            
            if player.returnPostion() == .midfielders {
                localPlayers.append(player)
            }
        }
        return localPlayers
        
    }
    
    func findForwards() -> [Player] {
        var localPlayers = [Player]()
        
        for player in players {
            
            if player.returnPostion() == .forwards {
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
    
    
    func filter(on filterParameter: Position) -> [Player] {
        switch filterParameter {
        case .goalkeeper:
            currentPostionSelected = .goalkeeper
            return findGoalkeepers()
            
        case .defenders:
            currentPostionSelected = .defenders
            return findDefenders()
            
        case .midfielders:
            currentPostionSelected = .midfielders
            return findMidfielders()
            
        case .forwards:
            currentPostionSelected = .forwards
            return findForwards()
            
        case .favourites:
            currentPostionSelected = .favourites
            
            return findFavourties()
        }
    }
    
}


