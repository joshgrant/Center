//
//  RCondition.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RCondition: Object, Condition
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var stock: Stock?
    @objc dynamic public var predicate: Predicate = .equal
    @objc dynamic public var target: Double = 0
    @objc dynamic public var priority: Priority = .linear
    @objc dynamic public var relationship: Relationship = .direct
    
    public var events = LinkingObjects(fromType: REvent.self, property: "_conditions")
}
