//
//  State.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol State:
    Entity,
    Named
{
    var min: Double { get set }
    var max: Double { get set }
}
