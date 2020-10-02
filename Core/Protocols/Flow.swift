//
//  Flow.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc protocol Flow: Entity
{
    var amount: Double { get set }
    
    var from: Stock? { get set }
    var to: Stock? { get set }
    
    var duration: TimeInterval { get set }
    var delay: TimeInterval { get set }
    
    var requiresUserCompletion: Bool { get set }
    var contactDelegate: Contact? { get set }
    
    /// Create a `Link<Event>` property
    func events() -> [Event]
    
    /// Create a `Link<FlowHistory>` property
    func history() -> [FlowHistory]
    func add(history: FlowHistory)
    
    // MARK: - Caching
    
    func eventsCount() -> Int
    func historyCount() -> Int
}

@objc protocol FlowHistory
{
    var amount: Double { get set }
}

// TODO: Perhaps link this to a contact card person
// by referencing an ID // 
@objc protocol Contact: Entity
{
    var name: String { get set }
    var phoneNumber: String { get set }
    var email: String { get set }
}
