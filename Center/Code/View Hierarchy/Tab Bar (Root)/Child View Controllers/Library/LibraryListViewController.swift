//
//  LibraryListViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class LibraryListViewController: ViewController
{
//    var viewFactory: LibraryListViewFactory
    
    var tableView: TableView?
    
    init(environment: LibraryListEnvironment) throws
    {
//        let dataModel = try makeLibraryListTableDataModel(context: environment.database.context)
//        self.tableView = makeTableView(from: dataModel)
        
        super.init()
//    }
    
//    init(viewFactory: LibraryListViewFactory)
//    {
//        self.viewFactory = viewFactory
//
//        self.tableView = makeTableView(
//            delegate: viewFactory.environment.tableViewDelegate,
//            dataSource: viewFactory.environment.tableViewDataSource)
//        registerCellModelTypes$(LibraryListTableViewDataSource.cellClassAndReuseIdentifiers(),
//                                in: tableView)
//
//        super.init()
//
        configureTabBarItem()
        configureNavigationItem()
    }
    
    override func loadView()
    {
        self.view = tableView
    }
    
    private func configureTabBarItem()
    {
        tabBarItem = makeUITabBarItem(tabBarItem: .library)
    }
    
    private func configureNavigationItem()
    {
        navigationItem.searchController = UISearchController()
    }
}
