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

struct DashboardViewFactory
{
    var environment: DashboardEnvironment
    
    init(environment: DashboardEnvironment)
    {
        self.environment = environment
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
