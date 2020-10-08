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
    // TODO: Why can't we use the generic <Event> here?
    lazy var eventFetchController: NSFetchedResultsController<DynamicSource> = {
        let controller = NSFetchedResultsController<DynamicSource>(
            fetchRequest: makeDateSourcesFetchRequest(),
            managedObjectContext: database.context,
            sectionNameKeyPath: nil,
            cacheName: nil)
        return controller
    }()
    
    var database: Database
    
    init(database: Database) throws
    {
        self.database = database
        
        super.init()

        eventFetchController.delegate = self
        try eventFetchController.performFetch()
    }
    
    func makeCellModels() -> [[TableViewCellModel]]
    {
        return [
            [],
            [],
            events(),
            []
        ]
    }
}

// MARK: - Events

extension DashboardViewCellModelFactory
{
    func events() -> [TableViewCellModel]
    {
        guard let sources = eventFetchController.fetchedObjects else {
            assertionFailure("Failed to get the fetched objects from: \(eventFetchController)")
            return []
        }
        
        let events = Event.eventsFromSources(sources)
        let cells = EventListCellModel.eventCellModelsFrom(events: events)

        return cells
    }
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
