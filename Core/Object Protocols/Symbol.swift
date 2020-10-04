//
//  Symbol.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Symbol:
    Entity,
    LinkStorage
{
    var name: String? { get set }
    
    /// Returns each object that uses this symbol as a name value
    /// The concrete instance of symbol should define a `List<Identified>` property
    func references() -> [Entity]
}
