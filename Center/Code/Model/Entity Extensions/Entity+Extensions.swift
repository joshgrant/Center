//
//  Entity+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import CoreData

public extension Entity
{
    func unwrapped<E, T: Hashable, K: Hashable>(_ keypath: KeyPath<E, T>) -> [K]
    {
        guard let self = self as? E else {
            assertionFailure("Failed to cast self to the correct type: \(E.self)")
            return []
        }
        
        guard let set = self[keyPath: keypath] as? NSSet else {
            assertionFailure("Failed to extract the NSSet from the keypath")
            return []
        }
        
        guard let unwrapped = set as? Set<K> else {
            assertionFailure("Failed to unwrap \(keypath) on the object")
            return []
        }
        
        return Array(unwrapped)
    }
}

public extension Entity
{
    static func makePinnedObjectsPredicate() -> NSPredicate
    {
        NSPredicate(format: "isPinned == %i", true)
    }
    
    static func makePinnedObjectsSortDescriptors() -> [NSSortDescriptor]
    {
        // TODO: Better keypath for sorting..
        [NSSortDescriptor(keyPath: \Entity.id, ascending: false)]
    }
    
    static func makePinnedObjectsFetchRequest() -> NSFetchRequest<Entity>
    {
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        fetchRequest.predicate = makePinnedObjectsPredicate()
        fetchRequest.sortDescriptors = makePinnedObjectsSortDescriptors()
        fetchRequest.shouldRefreshRefetchedObjects = true
        return fetchRequest
    }
}

public extension Entity
{
    @objc var title: String {
        return "Abstract Entity - No Title"
    }
}
