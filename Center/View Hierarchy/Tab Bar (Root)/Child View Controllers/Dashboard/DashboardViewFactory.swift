//
//  DashboardViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import CoreData
import Architecture
import Core

struct DashboardViewFactory: TabBarItemFactoryProtocol
{
    var environment: DashboardEnvironment
    
    init(environment: DashboardEnvironment)
    {
        self.environment = environment
    }
    
    func makeTabBarItem() -> UITabBarItem
    {
        return UITabBarItem(
            title: "Dashboard",
            image: Icon.dashboard.getImage(),
            selectedImage: Icon.dashboard.getImage())
    }
    
    // Search for "JUMP"
    // We can probably create a "table view factory" that makes this...
    // in fact, each part of the interface should be modular, right?
    func makeTableView() -> TableView
    {
        let tableView = TableView(frame: .zero, style: .grouped)
        
        environment.tableViewDataSource.configure(tableView: tableView)
        environment.tableViewDelegate.configure(tableView: tableView)
        
        return tableView
    }
    
    func makeSearchController() -> UISearchController
    {
        let searchResultsController = SearchViewController()
        let searchController = UISearchController(searchResultsController: searchResultsController)
        let searchBar = searchController.searchBar
        
        environment.searchBarDelegate.configure(searchBar: searchBar)
        
        return searchController
    }
}
