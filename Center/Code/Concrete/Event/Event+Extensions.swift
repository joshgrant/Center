//
//  Event+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import CoreData

extension Event: Named {}

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
