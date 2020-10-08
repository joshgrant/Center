//
//  LibraryListViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

class LibraryListViewController: ViewController
{
    var viewFactory: LibraryListViewFactory
    
    var tableView: TableView
    
    init(viewFactory: LibraryListViewFactory)
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
    
    private func configureTabBarItem()
    {
        tabBarItem = viewFactory.makeTabBarItem()
    }
    
    private func configureNavigationItem()
    {
        navigationItem.searchController = UISearchController()
    }
}
