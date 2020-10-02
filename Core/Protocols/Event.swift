//
//  Event.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Event: Entity
{
    var isActive: Bool { get set }
    
    /// Create a `Link<Condition>` property
    func conditions() -> [Condition]
    func add(condition: Condition)
    func delete(condition: Condition)
    
    /// Create a `Link<Flow>` property
    func flows() -> [Flow]
    func link(flow: Flow)
    func unlink(flow: Flow)
    
    /// Create a `Link<History>` property
    func history() -> [History]
    
    // MARK: - Caching
    
    func flowsCount() -> Int
    func historyCount() -> Int
}
