//
//  UnitStorage.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol UnitStorage
{
    func units() -> [Unit]
    func append(unit: Unit) throws
    func remove(unit: Unit) throws
}
