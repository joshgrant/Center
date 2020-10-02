//
//  State.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol State
{
    var name: String? { get set }
    
    /// The lower bound of the range that the state occupies
    var min: Double { get set }
    
    /// The uppes bound of the range that the state occupies
    var max: Double { get set }
}
