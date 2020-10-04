//
//  Conversion.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Conversion: Entity
{
    var from: Unit? { get set }
    var to: Unit? { get set }
    var ratio: Ratio? { get set }
    var isReversible: Bool { get set }
}
