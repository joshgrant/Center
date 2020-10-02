//
//  Dimension.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Dimension: Entity
{
    func units() -> [Unit]
    func add(unit: Unit)
    func remove(unit: Unit)
    
    // MARK: - Caching
    
    func unitsCount() -> Int
}
