//
//  Condition.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc protocol Condition
{
    var stock: Stock { get set }
    var predicate: Predicate { get set }
    var target: Double { get set }
    var priority: Priority { get set }
    var relationship: Relationship { get set }
}

@objc enum Predicate: Int, RealmEnum
{
    case lessThan
    case lessThanOrEqualTo
    case equal
    case greaterThanOrEqualTo
    case greaterThan
    case notEqual
    case didChange
    case didNotChange
}

@objc enum Priority: Int, RealmEnum
{
    case linear
    case quadratic
    case exponential
}

@objc enum Relationship: Int, RealmEnum
{
    case direct
    case inverse
}
