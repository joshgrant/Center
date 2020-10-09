//
//  DashboardViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

class DashboardViewController: ViewController
{
    var viewFactory: DashboardViewFactory
    let searchBarDelegate = DashboardSearchBarDelegate()
    
    var tableView: TableView
    
    init(viewFactory: DashboardViewFactory)
    {
        self.viewFactory = viewFactory

        let model = makeDashboardTableViewModel()
        self.tableView = makeTableView(from: model)
        
        super.init()

        configureTabBarItem()
        configureNavigationItem()
    }
    
    override func loadView()
    {
        self.view = tableView
    }
    
    // MARK: - Configuration
    
    private func configureTabBarItem()
    {
        tabBarItem = TabBarItem.dashboard.makeUITabBarItem()
    }
    
    private func configureNavigationItem()
    {
        let searchResultsController = SearchViewController()
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchBar.delegate = searchBarDelegate
        navigationItem.searchController = searchController
        
        navigationItem.hidesSearchBarWhenScrolling = true
    }
}
