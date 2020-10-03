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
    private let _history = List<RHistory>()
    private let _notes = List<RNote>()
}

// MARK: - Event storage

extension RFlow
{
    public func events() -> [Event]
    {
        _events.map { $0 as Event }
    }
    
    public func append(event: Event) throws
    {
        let event: REvent = try event.unwrap()
        try realm?.write {
            _events.append(event)
        }
    }
    
    public func remove(event: Event) throws
    {
        let event: REvent = try event.unwrap()
        try realm?.write {
            try _events.remove(object: event)
        }
    }
}

// MARK: - Note storage

extension RFlow
{
    public func notes() -> [Note]
    {
        _notes.map { $0 as Note }
    }
    
    public func append(note: Note) throws
    {
        
    }
    
    public func remove(note: Note) throws
    {
        
    }
}

// MARK: - History storage

extension RFlow
{
    public func history() -> [History]
    {
        _history.map { $0 as History }
    }
    
    public func append(history: History) throws
    {
        let history: RHistory = try history.unwrap()
        try realm?.write {
            _history.append(history)
        }
    }
    
    public func history(from: Date, to: Date) throws -> [History]
    {
        return []
    }
}
