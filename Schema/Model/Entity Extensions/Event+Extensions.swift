//
//  Event+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import CoreData

public extension Event
{
    var unwrappedName: String? {
        get {
            name?.name
        }
        set {
            if let name = name {
                name.name = newValue
            } else {
                guard let context = self.managedObjectContext else {
                    assertionFailure("Failed to add the name to the event because the event has no context")
                    return
                }
                
                name = Symbol(context: context, name: newValue)
            }
        }
    }
}

public extension Event
{
    var conditionType: ConditionType {
        get {
            ConditionType(rawValue: conditionTypeRaw) ?? .fallback
        }
        set {
            conditionTypeRaw = newValue.rawValue
        }
    }
}

public extension Event
{
    static func makeUpcomingEventsPredicate() -> NSPredicate
    {
        NSPredicate(value: false)
    }
    
    static func makeUpcomingEventsFetchRequest() -> NSFetchRequest<Event>
    {
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        fetchRequest.predicate = makeUpcomingEventsPredicate()
        return fetchRequest
    }
}

public extension Event
{
    static func eventsFromSources(_ sources: [Source]) -> [Event]
    {
        var targetEvents: [Event] = sources.flatMap {
            $0.targetOfCondition?.unwrappedEvents ?? []
        }
        
        let valueEvents = sources.flatMap {
            $0.valueOfCondition?.unwrappedEvents ?? []
        }
        
        targetEvents.append(contentsOf: valueEvents)
        
        return targetEvents
    }
}
