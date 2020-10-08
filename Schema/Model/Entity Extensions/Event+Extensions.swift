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
}
