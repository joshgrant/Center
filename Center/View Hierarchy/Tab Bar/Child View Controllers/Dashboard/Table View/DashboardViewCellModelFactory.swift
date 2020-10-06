//
//  DashboardViewTableCellModelFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData
import Schema

// TODO: Maybe a generic protocol to avoid being tied directly to CoreData?

class DashboardViewCellModelFactory: NSObject
{
//    var dataManager: CoreDataManager
//    
//    // TODO: Why can't we use the generic <Event> here?
//    lazy var eventFetchController: NSFetchedResultsController<Event> = {
//        let controller = NSFetchedResultsController<Event>(
//            fetchRequest: makeEventFetchRequest(),
//            managedObjectContext: dataManager.context,
//            sectionNameKeyPath: nil,
//            cacheName: nil)
//        return controller
//    }()
    
    init(dataManager: DataManagerProtocol)
    {
//        guard let dataManager = dataManager as? CoreDataManager else {
//            fatalError("The data managers aren't flexible enough")
//        }
        
//        self.dataManager = dataManager
//
//        super.init()
//
//        eventFetchController.delegate = self
//        try! eventFetchController.performFetch()
    }
    
    func makeCellModels() -> [[TableViewCellModel]]
    {
        return [
            [],
            [],
//            events(),
            []
        ]
    }
}

// MARK: - Events

extension DashboardViewCellModelFactory
{
//    func makeEventFetchRequest() -> NSFetchRequest<Event>
//    {
//        let request = Event.request()
//        // TODO: Fix the sort descriptors
//        request.sortDescriptors = [NSSortDescriptor(keyPath: \Event.isActive, ascending: true)]
//        request.fetchLimit = 9
//        // TODO: Add conditions for only events with date condition within two weeks
//        return request
//    }
//    
//    func events() -> [TableViewCellModel]
//    {
//        // They don't map to the proper type...
//        return eventFetchController.fetchedObjects ?? []
//    }
}

// MARK: - Fetch controller delegate

// TODO: Use an observer for this...

extension DashboardViewCellModelFactory: NSFetchedResultsControllerDelegate
{
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        print("Will change")
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    {
        print("Is changing")
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        print("Did change")
    }
}
