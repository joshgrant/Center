//
//  CoreDataManager.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

class CoreDataManager: DataManagerProtocol
{
    var context: NSManagedObjectContext
    {
        container.viewContext
    }
    
    var coordinator: NSPersistentStoreCoordinator
    {
        container.persistentStoreCoordinator
    }
    
    var persistentStoreURLs: [URL]
    {
        coordinator
            .persistentStores
            .compactMap { $0.url }
    }
    
    lazy var container: NSPersistentCloudKitContainer = {
        let model = CenterCoreDataModel()
        let container = NSPersistentCloudKitContainer(
            name: "Center",
            managedObjectModel: model)
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
        
        return container
    }()
    
    // MARK: - Object data store protocol
    
    func save()
    {
        if context.hasChanges
        {
            do
            {
                try context.save()
            }
            catch
            {
                assertionFailure(error.localizedDescription)
            }
        }
    }
    
    func undo()
    {
        context.undo()
    }
    
    func redo()
    {
        context.redo()
    }
    
    /// This completely erases the persistent store from disk,
    func deleteAllObjects()
    {
        do {
            try persistentStoreURLs.forEach
            {
                try coordinator.destroyPersistentStore(
                    at: $0,
                    ofType: NSSQLiteStoreType,
                    options: nil)
            }
        }
        catch
        {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func populateWithSampleData(_ sampleData: Any)
    {
        // TODO
    }
}
