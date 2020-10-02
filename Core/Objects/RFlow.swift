//
//  RFlow.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RFlow: Object, Flow
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    
    @objc dynamic public var amount: Double = 0
    @objc dynamic public var from: Stock?
    @objc dynamic public var to: Stock?
    @objc dynamic public var duration: TimeInterval = 0
    @objc dynamic public var delay: TimeInterval = 0
    @objc dynamic public var requiresUserCompletion: Bool = false
    @objc dynamic public var contactDelegate: Contact?
    
    private let _events = List<REvent>()
    private let _history = List<RFlowHistory>()
    private let _notes = List<RNote>()
    
    public func events() -> [Event] {
        _events.map { $0 as Event }
    }
    
    public func history() -> [FlowHistory] {
        _history.map { $0 as FlowHistory }
    }
    
    public func add(history: FlowHistory) {
        
    }
    
    // TODO: Cache
    public func eventsCount() -> Int {
        _events.count
    }
    
    // TODO: Cache
    public func historyCount() -> Int {
        return _history.count
    }
    
    public func notes() -> [Note] {
        _notes.map { $0 as Note }
    }
    
    public func link(note: Note) {
        
    }
    
    public func unlink(note: Note) {
        
    }
}
