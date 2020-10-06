//
//  Condition+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension Condition
{
    var relationshipType: Relationship
    {
        get {
            Relationship(rawValue: relationshipTypeRaw) ?? .fallback
        }
        set {
            relationshipTypeRaw = newValue.rawValue
        }
    }
    
    var priorityType: Priority
    {
        get {
            Priority(rawValue: priorityTypeRaw) ?? .fallback
        }
        set {
            priorityTypeRaw = newValue.rawValue
        }
    }
    
    var predicateType: Predicate
    {
        get {
            Predicate(rawValue: predicateTypeRaw) ?? .fallback
        }
        set {
            predicateTypeRaw = newValue.rawValue
        }
    }
}
