//
//  Main.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation
import CoreData

/**
 
 Structs contain state
 Classes contain variables
 Functions contain functions
 
 */

struct SymbolConstructor
{
    var context: Context
    
    var id: UUID = .init()
    var name: String
    var isPinned: Bool
}

func makeSymbol(with constructor: SymbolConstructor)
{
    // TODO: This should be codable...
    let symbol = Symbol(context: constructor.context)
    symbol.id = constructor.id
    symbol.name = constructor.name
    symbol.isPinned = constructor.isPinned
}

func makePinnedObjectsFetchRequest() -> NSFetchRequest<Entity>
{
    let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "isPinned == %@", true)
    fetchRequest.shouldRefreshRefetchedObjects = true
    return fetchRequest
}

func makeDashboardSuggestedFlowsFetchRequest() -> NSFetchRequest<Flow>
{
    let fetchRequest: NSFetchRequest<Flow> = Flow.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "@suggestedIn.count > %@", 0)
    fetchRequest.shouldRefreshRefetchedObjects = true
    return fetchRequest
}

func makeDashboardUpcomingEventsFetchRequest() -> NSFetchRequest<Event>
{
    let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
    // The event has a condition
    // The event's condition is based off of the "Date" stock (TimeInterval)
    // The event's target value is greater than the current Date value
//    fetchRequest.predicate = NSPredicate(format: "conditions", )
}

func performFetchRequest<T>(fetchRequest: NSFetchRequest<T>, dataManager: DataManager) -> [T]
{
    do {
        let result = try dataManager.context.fetch(fetchRequest)
        return result
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}
