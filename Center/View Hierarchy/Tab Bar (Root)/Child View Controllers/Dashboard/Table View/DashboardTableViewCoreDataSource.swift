//
//  DashboardTableViewCoreDataSource.swift
//  Center
//
//  Created by Joshua Grant on 9/27/20.
//

import UIKit
import CoreData

class DashboardTableViewCoreDataSource: NSObject, TableViewDataSource
{
    var headerModelFactory: DashboardViewHeaderModelFactory
    var cellModelFactory: DashboardViewCellModelFactory
    
    init(headerModelFactory: DashboardViewHeaderModelFactory,
         cellModelFactory: DashboardViewCellModelFactory)
    {
        self.headerModelFactory = headerModelFactory
        self.cellModelFactory = cellModelFactory
    }
    
    func cellClassAndReuseIdentifiers() -> [TableViewCellModel.Type]
    {
        return [
            // Hmm, any cell? Maybe "BaseObject" cell for pinned...
            EventListCellModel.self
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return headerModelFactory.headerModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // TODO: Cache this value
        return cellModelFactory.makeCellModels()[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // TODO: Cache this value
        let model = cellModelFactory.makeCellModels()[indexPath.section][indexPath.row]
        let identifier = type(of: model).cellReuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let cell = cell as? TableViewCell
        {
            cell.configureWithViewModel(model)
        }
        
        return cell
    }
}
