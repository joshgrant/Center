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
    var viewFactory: DashboardViewFactoryProtocol
    let searchBarDelegate = DashboardSearchBarDelegate()
    
    var tableView: UITableView
    
    init(viewFactory: DashboardViewFactoryProtocol)
    {
        self.viewFactory = viewFactory
        self.tableView = viewFactory.makeTableView()
        
        super.init()

        configureTabBarItem()
        configureNavigationItem()
    }
    
    override func loadView()
    {
        self.view = tableView
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // MARK: - Configuration
    
    func configureTabBarItem()
    {
        tabBarItem = viewFactory.makeTabBarItem()
    }
    
    func configureNavigationItem()
    {
        let searchResultsController = SearchViewController()
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchBar.delegate = searchBarDelegate
        navigationItem.searchController = searchController
        
        navigationItem.hidesSearchBarWhenScrolling = true
    }
}
