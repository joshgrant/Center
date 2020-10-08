//
//  Source+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

public extension Source
{
    @objc var computedValue: Any {
        assertionFailure("Override this property in your subclass")
        return -1
    }
}

func eventsFromSources(_ sources: [Source]) -> [Event]
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
