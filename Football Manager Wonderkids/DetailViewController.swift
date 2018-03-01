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
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem, let players = players {
            for player in players {
                print(player.name)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }


    // Mark:- TableView Delegate
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
    // Mark:- TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = players?.count  {
            return count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        
        cell.textLabel?.text = players?[indexPath.row].name
        
        return cell
    }


}

