//
//  DateStock.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation
import CoreData

public func makeDateSourcesPredicate() -> NSPredicate
{
    NSPredicate(format: "sourceTypeRaw == %i", SourceType.date.rawValue)
}

public func makeDateSourcesSortDescriptors() -> [NSSortDescriptor]
{
    // We are sorting by `id` but it's unnecessary - just a requirement of a fetchedResultsController
    [NSSortDescriptor(keyPath: \DynamicSource.id, ascending: true)]
}

public func makeDateSourcesFetchRequest() -> NSFetchRequest<DynamicSource>
{
    let fetchRequest: NSFetchRequest<DynamicSource> = DynamicSource.fetchRequest()
    fetchRequest.predicate = makeDateSourcesPredicate()
    fetchRequest.sortDescriptors = makeDateSourcesSortDescriptors()
    return fetchRequest
}
