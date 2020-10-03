//
//  Ideal.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

// TODO: This needs to be more flexible - if ideal is state,
// we need to keep a value of a state machine
// If ideal is value, we need to keep a double
// If ideal is relative, we need to keep a percent
// If ideal is stock, we need to keep a reference

@objc public protocol Ideal: Entity
{
    var idealType: IdealType { get set }
    var state: State? { get set }
}
