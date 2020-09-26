//
//  DashboardTableViewDataSource.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit
import CoreData
import Architecture

class DashboardTableViewDataSource: NSObject, TableViewDataSource
{
//    var headerModels: [TableViewHeaderModel]
//    var cellModels: [TableViewCellModel]
    
    var dataManager: DataManagerProtocol
    
    init(headerModelFactory: DashboardViewHeaderModelFactory,
         cellModelFactory: DashboardViewCellModelFactory,
         dataManager: DataManagerProtocol)
    {
//        self.headerModels = headerModelFactory.makeHeaderModels()
//        self.cellModels = cellModelFactory.makeCellModels()
        self.dataManager = dataManager
        
        super.init()
        
        eventFetchController.delegate = self
    }
    
    func cellClassAndReuseIdentifiers() -> [TableViewCellModel]
    {
        return cellModels
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return headerModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section
        {
        case 0:
            return 0
        case 1:
            return 0
        case 2:
            return eventFetchController.fetchedObjects?.count ?? 0
        case 3:
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // TODO: Decouple the table view data from core data
        guard let model = eventFetchController.fetchedObjects?[indexPath.row] else {
            fatalError("Failed to fetch a valid model")
        }
        let identifier = model.cellReuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let cell = cell as? TableViewCell
        {
            cell.configureWithViewModel(model)
        }
        
        return cell
    }
}

extension DashboardTableViewDataSource: NSFetchedResultsControllerDelegate
{
    // OLD:
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
    }
}
