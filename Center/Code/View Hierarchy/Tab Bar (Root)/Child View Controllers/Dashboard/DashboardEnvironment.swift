//
//  DashboardEnvironment.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

class DashboardEnvironment
{
//    var database: Database
//    
//    init(database: Database)
//    {
//        self.database = database
//    }
//    
//    lazy var headerModelFactory: DashboardViewHeaderModelFactory = {
//       DashboardViewHeaderModelFactory()
//    }()
//    
//    lazy var cellModelFactory: DashboardViewCellModelFactory = {
//        try! DashboardViewCellModelFactory(database: database)
//    }()
//    
//    lazy var tableViewDataSource: DashboardTableViewCoreDataSource = {
//        DashboardTableViewCoreDataSource(
//            headerModelFactory: headerModelFactory,
//            cellModelFactory: cellModelFactory)
//    }()
//    
//    lazy var tableViewDelegate: DashboardTableViewDelegate = {
//        DashboardTableViewDelegate(
//            headerModelFactory: headerModelFactory)
//    }()
    
    lazy var searchBarDelegate: DashboardSearchBarDelegate = {
       return DashboardSearchBarDelegate()
    }()
}
