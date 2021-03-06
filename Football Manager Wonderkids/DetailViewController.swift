//
//  DetailViewController.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 22/02/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    
    var players: [Player]? {
        didSet {
            configureView()
        }
    }
    
    var position: Position?
    
    func configureView() {
        // Update the user interface for the detail item.
        if let _ = detailItem, let _ = players {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        tableView.tableFooterView = UIView(frame: .zero) //prevent extra cell
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.sortingMethodNotification(notification:)), name: Notification.Name("sort"), object: nil)
        
        let sortPreviouslySelected = UserDefaults.standard.integer(forKey: "sortType")
        let sortType = Sort(rawValue: sortPreviouslySelected)!
        sortMethod(type: sortType)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
    }
    
    @objc func appMovedToBackground() {
        print("App moved to background!")
        self.tableView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: true)
        //        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableViewScrollPosition.top, animated: true) //Stops the werid floating header sorting type
    }
    
    
    @objc func sortingMethodNotification(notification: Notification){
        //        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        guard let type = notification.userInfo?["type"] as? Int else { return }
        print("Recieved Observer: \(notification)")
        
        let sortType = Sort(rawValue: type)!
        print("sort: \(sortType)")
        sortMethod(type: sortType)
        
        tableView.reloadData()
        
    }
    
    func sortMethod(type: Sort) {
        switch type {
        case .name:
            
            players?.sort(by: { (playerOne, playerTwo) -> Bool in
                if playerOne.name <= playerTwo.name {
                    return true
                }
                return false
            })
            
        case .rating:
            players?.sort(by: { (playerOne, playerTwo) -> Bool in
                if playerOne.rating >= playerTwo.rating {
                    return true
                }
                return false
            })
            
        case .position:
            
            players?.sort(by: { (playerOne, playerTwo) -> Bool in
                
                if position == .favourites {
                    if playerOne.returnPostion().hashValue < playerTwo.returnPostion().hashValue {
                        return true
                    }
                    return false
                    
                } else {
                    if playerOne.position < playerTwo.position {
                        return true
                    }
                    return false
                }
            })
            
        case .price:
            players?.sort(by: { (playerOne, playerTwo) -> Bool in
                guard let playerOneValue = Double(playerOne.value), let playerTwoValue = Double(playerTwo.value) else { return false }
                
                if playerOneValue > playerTwoValue {
                    return true
                }
                return false
            })
            
        }
    }
    
    
    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //return headerCell
        return headerCell(at: section)
    }
    
    ///Custom Header cell for the sorting options.
    func headerCell(at indexPathSection: Int) -> SortingTableViewCell {
        let reuseID = "sortingCell"
        let nibName = "SortingCell"
        
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseID)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as! SortingTableViewCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }
    
    // MARK:- Selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! PlayerTableViewCell
        let player = players![indexPath.row]
        
        cell.selectionStyle = .none //prevent grey animation
        
        if player.isFavourite == false {
            player.isFavourite = true
            cell.favourite.image = #imageLiteral(resourceName: "Favourites")
        } else {
            player.isFavourite = false
            cell.favourite.image = #imageLiteral(resourceName: "noHeart")
        }
    }
    
    
    // MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = players?.count  {
            return count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return playerCell(at: indexPath)
    }
    
    ///Main Player Cell
    func playerCell(at indexPath: IndexPath) -> PlayerTableViewCell {
        let reuseID = "playerCell"
        let nibName = "PlayerCell"
        
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseID)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as! PlayerTableViewCell
        
        if let player = players?[indexPath.row] {
            cell.configure(player: player)
        }
        
        return cell
    }
    
    
}

