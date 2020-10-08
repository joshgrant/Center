//
//  ConditionExamples.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

// For a condition to evaluate to "true" it needs to be a boolean equation
// It can use various operators (>=, <, ==, !=, distance)
// It can combine operators together using AND, OR, NOT

// Each condition has a leftHand, a rightHand, and a comparison
// If the leftHand, and rightHand, and comparison produce a "true" value, the condition is true

// To get the value of the left or right hand, we have several options:
// 1. App-provided value
// 2. Range of values
// 3. Relation value (i.e related to a system or a stock)
// 4. Static value
// 5. Dynamic (i.e 1st of every month)

// How can the app store references?
// Well, if the value is app-provided, we can store an enum value
// If the value is a range, we can specify min, max, and whether the range is inclusive
// If the value is a relation, we can specify it's id.
// If the value is static, it provides its own value
// If the value is dynamic, it can look like the following:
//    1st of every month
//    every 5 minutes
//    every 2 weeks == every other week
//    every week on tuesdays and thursdays
//    last day in every month
// A dynamic value returns true when the opposite hand matches the value with the given granularity
// Is this just for dates or can it be for other values?

// Match when the leftHand is divisible by 2...
// Match when the rightHand passes the given function...

// What we want to make are "functions" that return true, and allow the user to select these functions...

enum BasicOperator
{
    case lessThan
    case lessThanOrEqual
    case greaterThan
    case greaterThanOrEqual
    case equal
    case notEqual
}

func passes(basicOperator: BasicOperator, value: Double, target: Double) -> Bool
{
    switch basicOperator
    {
    case .lessThan:
        return value < target
    case .lessThanOrEqual:
        return value <= target
    case .greaterThan:
        return value > target
    case .greaterThanOrEqual:
        return value >= target
    case .equal:
        return value == target
    case .notEqual:
        return value != target
    }
}

func withinRange(value: Double, rangeMin: Double, rangeMax: Double, includesMin: Bool, includesMax: Bool) -> Bool
{
    let aboveMin: Bool
    let belowMax: Bool
    
    if includesMin {
        aboveMin = value >= rangeMin
    } else {
        aboveMin = value > rangeMin
    }
    
    if includesMax {
        belowMax = value <= rangeMax
    } else {
        belowMax = value < rangeMax
    }
    
    return aboveMin && belowMax
}

// What if instead of getting entities, we got Sources? Like the concrete types? Then we could get the conditon, and then we could get the events?
// So, to find the date,
// we search for DynamicSource
// with sourceTypeRaw == date
// Then, we can get the conditions
// Then, the events, and we can return non-hidden events...
