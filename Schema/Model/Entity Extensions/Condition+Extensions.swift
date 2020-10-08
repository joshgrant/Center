//
//  Condition+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

public extension Condition
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
            return Comparison(rawValue: comparisonTypeRaw) ?? .fallback
        }
        set {
            comparisonTypeRaw = newValue.rawValue
        }
    }
}

public extension Condition
{
    var unwrappedEvents: Set<Event> {
        guard let unwrapped = events as? Set<Event> else {
            assertionFailure("Failed to unwrap the events NSSet to an [Event]")
            return []
        }
        
        return unwrapped
    }
}

public extension Condition
{
    var isSatisfied: Bool {

        guard let left = leftHand?.computedValue else {
            assertionFailure("The left hand value is nil for: \(self)")
            return false
        }
        
        guard let right = rightHand?.computedValue else {
            assertionFailure("The right hand value is nil for: \(self)")
            return false
        }
        
        let comparison = comparisonType
        
        let valueComparison = (try? satisfiesValueComparison(comparison, left: left, right: right)) ?? false
        let rangeComparison = (try? satisfiesRangeComparison(comparison, left: left, right: right)) ?? false
        
        // let dateComparison
        // after, before, inTheLast, notInTheLast
        
        // let stringComparison
        // beginsWith
        // endsWith
        // contains
        // doesNotContain
        
        // let enumComparison
        // equal
        // notEqual
        
        return valueComparison || rangeComparison
    }
    
    private func satisfiesValueComparison(_ comparison: Comparison, left: Any, right: Any) throws -> Bool
    {
        guard let _left = left as? Double else {
            throw ConditionError.invalidType(given: left, expected: Double.self)
        }
        
        guard let _right = right as? Double else {
            throw ConditionError.invalidType(given: right, expected: Double.self)
        }
        
        switch comparison
        {
        case .equal:
            return _left == _right
        case .notEqual:
            return _left != _right
        case .greaterThan:
            return _left > _right
        case .lessThan:
            return _left < _right
        case .greaterThanOrEqual:
            return _left >= _right
        case .lessThanOrEqual:
            return _left <= _right
        default:
            throw ConditionError.invalidComparison
        }
    }
    
    private func satisfiesRangeComparison(_ comparison: Comparison, left: Any, right: Any) throws -> Bool
    {
        guard let _left = left as? Double else {
            throw ConditionError.invalidType(given: left, expected: Double.self)
        }
        
        guard let _right = right as? ClosedRange<Double> else {
            throw ConditionError.invalidType(given: right, expected: ClosedRange<Double>.self)
        }
        
        switch comparison {
        case .inTheRange:
            return _right.contains(_left)
        default:
            throw ConditionError.invalidComparison
        }
    }
}

public enum ConditionError: Error
{
    case invalidType(given: Any, expected: Any)
    case invalidComparison
}
