//
//  DashboardEnvironment.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol DashboardEnvironmentProtocol
{
    var dataManager: DataManagerProtocol { get }
    
    init(dataManager: DataManagerProtocol)
    
    var headerModelFactory: DashboardViewHeaderModelFactory { get }
    var cellModelFactory: DashboardViewCellModelFactory { get }
    var tableViewDataSource: DashboardTableViewDataSource { get }
    var tableViewDelegate: DashboardTableViewDelegate { get }
    var searchBarDelegate: DashboardSearchBarDelegate { get }
}

class DashboardEnvironment: DashboardEnvironmentProtocol
{
    var dataManager: DataManagerProtocol
    
    required init(dataManager: DataManagerProtocol)
    {
        self.dataManager = dataManager
    }
    
    lazy var headerModelFactory: DashboardViewHeaderModelFactory = {
       DashboardViewHeaderModelFactory()
    }()
    
    lazy var cellModelFactory: DashboardViewCellModelFactory = {
        DashboardViewCellModelFactory(
            dataManager: dataManager)
    }()
    
    lazy var tableViewDataSource: DashboardTableViewDataSource = {
        DashboardTableViewDataSource(
            headerModelFactory: headerModelFactory,
            cellModelFactory: cellModelFactory,
            dataManager: dataManager)
    }()
    
    lazy var tableViewDelegate: DashboardTableViewDelegate = {
        DashboardTableViewDelegate(
            headerModelFactory: headerModelFactory)
    }()
    
    lazy var searchBarDelegate: DashboardSearchBarDelegate = {
       return DashboardSearchBarDelegate()
    }()
}
