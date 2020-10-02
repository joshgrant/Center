//
//  Ideal.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

// TODO: This needs to be more flexible - if ideal is state,
// we need to keep a value of a state machine
// If ideal is value, we need to keep a double
// If ideal is relative, we need to keep a percent
// If ideal is stock, we need to keep a reference

@objc protocol Ideal
{
    var idealType: IdealType { get set }
    var state: State { get set }
}

@objc protocol State
{
    var name: String { get set }
    
    /// The lower bound of the range that the state occupies
    var min: Double { get set }
    
    /// The uppes bound of the range that the state occupies
    var max: Double { get set }
}

@objc enum IdealType: Int, RealmEnum
{
    /// This sets up the stock as a state machine type with ideal being a state
    case state
    
    /// This just sets an ideal value
    case value
    
    /// This sets the ideal value as a percentage (positive or negavite) of the
    /// current value
    case relative
    
    /// This sets the ideal value to another stock in the system
    case stock
}
