//
//  ConditionStorage.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol ConditionStorage
{
    func conditions() -> [Condition]
    func append(condition: Condition) throws
    func remove(condition: Condition) throws
}
