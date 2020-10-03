//
//  Conversion.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Conversion: Entity
{
    var from: Symbol? { get set }
    var to: Symbol? { get set }
    var ratio: Ratio? { get set }
    var isReversible: Bool { get set }
}
