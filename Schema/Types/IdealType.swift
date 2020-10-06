//
//  IdealType.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

public enum IdealType: Int16
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

extension IdealType: FallbackProtocol
{
    static let fallback: IdealType = .state
}
