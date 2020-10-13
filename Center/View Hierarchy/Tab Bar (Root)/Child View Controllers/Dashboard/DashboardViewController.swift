//
//  DashboardViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class DashboardViewController: ViewController
{
    var tableView: TableView
    
    init(tableView: TableView, tabBarItem: UITabBarItem)
    {
        self.tableView = tableView
        
        super.init()
        
        self.tabBarItem = tabBarItem
    }
    
    override func loadView()
    {
        self.view = tableView
    }
}
