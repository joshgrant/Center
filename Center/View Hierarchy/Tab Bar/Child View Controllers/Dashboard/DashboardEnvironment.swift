//
//  DashboardEnvironment.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import Schema

protocol DashboardEnvironmentProtocol
{
    var database: Database { get }
    
    init(database: Database)
    
    var headerModelFactory: DashboardViewHeaderModelFactory { get }
    var cellModelFactory: DashboardViewCellModelFactory { get }
    var tableViewDataSource: DashboardTableViewCoreDataSource { get }
    var tableViewDelegate: DashboardTableViewDelegate { get }
    var searchBarDelegate: DashboardSearchBarDelegate { get }
}

class DashboardEnvironment: DashboardEnvironmentProtocol
{
    var database: Database
    
    required init(database: Database)
    {
        self.database = database
    }
    
    lazy var headerModelFactory: DashboardViewHeaderModelFactory = {
       DashboardViewHeaderModelFactory()
    }()
    
    lazy var cellModelFactory: DashboardViewCellModelFactory = {
        try! DashboardViewCellModelFactory(
            database: database)
    }()
    
    lazy var tableViewDataSource: DashboardTableViewCoreDataSource = {
        DashboardTableViewCoreDataSource(
            headerModelFactory: headerModelFactory,
            cellModelFactory: cellModelFactory)
    }()
    
    lazy var tableViewDelegate: DashboardTableViewDelegate = {
        DashboardTableViewDelegate(
            headerModelFactory: headerModelFactory)
    }()
    
    lazy var searchBarDelegate: DashboardSearchBarDelegate = {
       return DashboardSearchBarDelegate()
    }()
}
