//
//  Unit.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc protocol Unit: Entity
{
    var isBaseUnit: Bool { get set }
    var relativeTo: Unit? { get set }
    var ratio: Ratio { get set }
}

@objc protocol Ratio
{
    var left: Double { get set }
    var right: Double { get set }
}
