//
//  PinnedObjects.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation
import CoreData

func makePinnedObjectsPredicate() -> NSPredicate
{
    NSPredicate(format: "isPinned == %@", true)
}

func makePinnedObjectsFetchRequest() -> NSFetchRequest<Entity>
{
    let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
    fetchRequest.predicate = makePinnedObjectsPredicate()
    fetchRequest.shouldRefreshRefetchedObjects = true
    return fetchRequest
}
