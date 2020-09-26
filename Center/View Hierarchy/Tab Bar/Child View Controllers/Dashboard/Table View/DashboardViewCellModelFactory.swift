//
//  DashboardViewTableCellModelFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData
import Architecture

struct DashboardViewCellModelFactory
{
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol)
    {
        self.dataManager = dataManager
    }
    
    func makeCellModels() -> [TableViewCellModel]
    {
        // TODO: This should have the fetched results controller, right?
        return []
    }
}
