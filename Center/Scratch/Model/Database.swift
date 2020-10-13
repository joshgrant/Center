//
//  Database.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation
import CoreData

public typealias Container = NSPersistentCloudKitContainer
public typealias Coordinator = NSPersistentStoreCoordinator
public typealias Context = NSManagedObjectContext
public typealias Model = NSManagedObjectModel

public enum DatabaseError: Error
{
    case nilModelURL
    case nilModel
    case failedToLoadPersistentStores
}

public func makeContainer(modelName: String) throws -> Container
{
    guard let modelURL = getModelURL(modelName: modelName) else {
        throw DatabaseError.nilModelURL
    }
    
    guard let model = makeModel(from: modelURL) else {
        throw DatabaseError.nilModel
    }
    
    let container = Container(name: modelName, managedObjectModel: model)
    return container
}

func getModelURL(modelName: String) -> URL?
{
    Bundle.main.resourceURL?
//        .appendingPathComponent("Frameworks")
//        .appendingPathComponent("Schema.framework")
        .appendingPathComponent("Model.momd")
}

func makeModel(from url: URL) -> Model?
{
    Model(contentsOf: url)
}

public func loadPersistentStores(on container: Container) throws -> Container
{
    container.loadPersistentStores { (description, error) in
        if let error = error as NSError? {
            fatalError("\(error.userInfo)")
        }
    }
    
    return container
}

func populate(context: Context)
{
    populateDatabaseWithBirthdayPartyEvent(context: context)
    save(context: context)
}

public func erase(coordinator: Coordinator) throws
{
    for store in coordinator.persistentStores
    {
        if let path = store.url?.path
        {
            try FileManager.default.removeItem(atPath: path)
        }
        
        try coordinator.remove(store)
    }
}

public func redo(context: Context)
{
    context.redo()
}

public func undo(context: Context)
{
    context.undo()
}

public func save(context: Context)
{
    guard context.hasChanges else { return }
    
    context.perform {
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

public func context(from container: Container) -> Context { container.viewContext }
public func model(from container: Container) -> Model { container.managedObjectModel }
public func coordinator(from container: Container) -> Coordinator { container.persistentStoreCoordinator }
