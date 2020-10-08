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

protocol DashboardViewFactoryProtocol: TabBarItemFactoryProtocol
{
    func makeTableView() -> TableView
}

struct DashboardViewFactory: DashboardViewFactoryProtocol
{
    var environment: DashboardEnvironmentProtocol
    
    init(environment: DashboardEnvironmentProtocol)
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
