//
//  MasterViewController.swift
//  Football Manager Wonderkids
//
//  Created by Izzy Ali on 22/02/2018.
//  Copyright © 2018 Izzy Ali. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    lazy var dataSource: MenuTitles = {
        let dataSource = MenuTitles()
        return dataSource
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = dataSource.titles[indexPath.row] as! String
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    
    // Mark: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.titles.count
    }

    /// custom cell
    func mainCell(for indexPath: IndexPath) -> MenuTableViewCell {
        let reuseID = "menuCell"
        let nibName = "MenuCell"
        
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseID)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID) as! MenuTableViewCell
        let title = dataSource.titles[indexPath.row]
        cell.configure(title)
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return mainCell(for: indexPath)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
    }
}


























