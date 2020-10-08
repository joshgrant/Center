//
//  Event+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

public extension Event
{
    var unwrappedConditions: Set<Condition> {
        guard let unwrapped = conditions as? Set<Condition> else {
            assertionFailure("Failed to unwrap the conditions NSSet to an [Condition]")
            return []
        }
        
        return unwrapped
    }
    
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
