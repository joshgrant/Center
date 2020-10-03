//
//  Ratio.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Ratio: Entity
{
    var left: Double { get set }
    var right: Double { get set }
}
