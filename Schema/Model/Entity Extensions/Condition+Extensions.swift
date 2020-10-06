//
//  Condition+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension Condition
{
    var priorityType: Priority
    {
        get {
            Priority(rawValue: priorityTypeRaw) ?? .fallback
        }
        set {
            priorityTypeRaw = newValue.rawValue
        }
    }
    
    var comparisonType: Comparison
    {
        get {
            let value = UInt(comparisonTypeRaw)
            return Comparison(rawValue: value) ?? .fallback
        }
        set {
            comparisonTypeRaw = Int16(newValue.rawValue)
        }
    }
}
