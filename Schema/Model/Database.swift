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

open class Database
{
    public static let shared = Database()
    
    public lazy var container: Container = {
        
        let modelName = "Model"
        
        guard let url = Bundle(for: type(of: self)).url(forResource: modelName, withExtension: "momd") else {
            fatalError("Failed to load model from bundle")
        }
        
        guard let model = Model(contentsOf: url) else {
            fatalError("Failed to initialized model from: \(url)")
        }
        
        let container = Container(name: modelName, managedObjectModel: model)
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
        
        return container
    }()
    
    public var context: Context { container.viewContext }
    
    public var model: Model { container.managedObjectModel }
    
    public var coordinator: Coordinator { container.persistentStoreCoordinator }
    
    public func save()
    {
        // TODO: Consider doing this on the context's thread, if not already?
        
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func undo()
    {
        context.undo()
    }
    
    public func redo()
    {
        context.redo()
    }
    
    public func erase() throws
    {
        for store in coordinator.persistentStores
        {
            if let path = store.url?.path {
                try FileManager.default.removeItem(atPath: path)
            }
            
            try coordinator.remove(store)
        }
    }
    
    public func populate()
    {
        populateDatabaseWithBirthdayPartyEvent(context: context)
        
        save()
    }
}
