//
//  Condition.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Condition: Entity
{
    var stock: Stock? { get set }
    var predicate: Predicate { get set }
    var target: Double { get set }
    var priority: Priority { get set }
    var relationship: Relationship { get set }
}
