//
//  RTransferFlow.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation
import RealmSwift

open class RTransferFlow: Object, TransferFlow
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    @objc dynamic public var amount: Double = 0
    @objc dynamic public var from: Stock?
    @objc dynamic public var to: Stock?
    @objc dynamic public var duration: TimeInterval = 0
    @objc dynamic public var delay: TimeInterval = 0
    @objc dynamic public var requiresUserCompletion: Bool = true
    @objc dynamic public var contactDelegate: Contact?
    
    let _events = List<REvent>()
    let _notes = List<RNote>()
    let _history = List<RHistory>()
}

// MARK: - Event storage

public extension RTransferFlow
{
    func events() -> [Event]
    {
        _events.map { $0 as Event }
    }
    
    func append(event: Event) throws
    {
        
    }
    
    func remove(event: Event) throws
    {
        
    }
}

// MARK: - Note storage

public extension RTransferFlow
{
    func notes() -> [Note]
    {
        _notes.map { $0 as Note }
    }
    
    func append(note: Note) throws
    {
        
    }
    
    func remove(note: Note) throws
    {
        
    }
}

// MARK: - History storage

public extension RTransferFlow
{
    func history() -> [History]
    {
        _history.map { $0 as History }
    }
    
    func append(history: History) throws
    {
        
    }
    
    func history(from: Date, to: Date) throws -> [History]
    {
        return []
    }
}
