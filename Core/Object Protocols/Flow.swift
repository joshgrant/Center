//
//  Flow.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Flow:
    Entity,
    Named,
    EventStorage,
    HistoryStorage
{
    var amount: Double { get set }
    
    var from: Stock? { get set }
    var to: Stock? { get set }
    
    var duration: TimeInterval { get set }
    var delay: TimeInterval { get set }
    
    var requiresUserCompletion: Bool { get set }
    var contactDelegate: Contact? { get set }
}
