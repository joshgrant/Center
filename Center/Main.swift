//
//  Main.swift
//  Center
//
//  Created by Joshua Grant on 10/9/20.
//

import UIKit
import Core
import Schema
import Architecture


//struct TabBarControllerModel
//{
//
//}

func makeTabBarControllers() -> [UIViewController]
{
    TabBarItem.allCases.map {
        makeViewController(tabBarItem: $0)
    }
}

func makeViewController(tabBarItem: TabBarItem) -> UIViewController
{
    switch tabBarItem
    {
    case .dashboard:
        return makeDashboardRootViewController()
    case .library:
        return makeLibraryRootViewController()
    case .inbox:
        return makeInboxRootViewController()
    case .settings:
        return makeSettingsRootViewController()
    }
}

// Dashboard

func makeDashboardRootViewController() -> UIViewController
{
    let tableViewModel = makeDashboardTableViewModel()
    let tableView = makeTableView(from: tableViewModel)
    
    let tabBarItem = TabBarItem.dashboard.makeUITabBarItem()
    let delegate = DashboardSearchBarDelegate()
    
    var controller = DashboardViewController(
        tableView: tableView,
        tabBarItem: tabBarItem)
    
    // TODO: not in love with this mechanism...
    controller = configureDashboardRootViewControllerNavigationItem(
        on: controller,
        searchBarDelegate: delegate)
    
    return controller
}

func configureDashboardRootViewControllerNavigationItem(
    on controller: DashboardViewController,
    searchBarDelegate: UISearchBarDelegate) -> DashboardViewController
{
    let searchController = makeDashboardSearchController(searchBarDelegate: searchBarDelegate)
    controller.navigationItem.searchController = searchController
    controller.navigationItem.hidesSearchBarWhenScrolling = true
    return controller
}

func makeDashboardSearchViewController() -> SearchViewController
{
    SearchViewController()
}

func makeDashboardSearchController(searchBarDelegate: UISearchBarDelegate) -> UISearchController
{
    let searchResultsController = makeDashboardSearchViewController()
    let searchController = UISearchController(searchResultsController: searchResultsController)
    searchController.searchBar.delegate = searchBarDelegate
    return searchController
}

// Library

func makeLibraryRootViewController() -> UIViewController
{
    //        let viewFactory = LibraryListViewFactory(environment: libraryListEnvironment)
    //        let viewController = LibraryListViewController(viewFactory: viewFactory)
    //        let navigationController = NavigationController(rootViewController: viewController)
    //        return navigationController
    return UIViewController() // TODO: FIX
}

func makeInboxRootViewController() -> UIViewController
{
    let viewFactory = InboxViewFactory()
    let viewController = InboxViewController(viewFactory: viewFactory)
    let navigationController = NavigationController(rootViewController: viewController)
    return navigationController
}

func makeSettingsRootViewController() -> UIViewController
{
    let viewFactory = SettingsViewFactory()
    let viewController = SettingsViewController(viewFactory: viewFactory)
    let navigationController = NavigationController(rootViewController: viewController)
    return navigationController
}
