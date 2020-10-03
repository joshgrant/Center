//
//  REvent.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class REvent: Object, Event
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    @objc dynamic public var isActive: Bool = true
    
    private let _conditions = List<RCondition>()
    private let _flows = List<RFlow>()
    private let _history = List<RHistory>()
    private let _notes = List<RNote>()
    
    public func notes() -> [Note]
    {
        _notes.map { $0 as Note }
    }
    
    public func link(note: Note) throws
    {
        let note: RNote = try note.unwrap()
        try realm?.write {
            _notes.append(note)
        }
    }
    
    public func unlink(note: Note) throws
    {
        let note: RNote = try note.unwrap()
        
        guard let index = _notes.index(of: note) else {
            throw RealmError.noObjectIndex
        }
        
        try realm?.write {
            _notes.remove(at: index)
        }
    }
}

// MARK: - Condition storage

extension REvent
{
    public func conditions() -> [Condition]
    {
        _conditions.map { $0 as Condition }
    }
    
    public func append(condition: Condition) throws
    {
        
    }
    
    public func remove(condition: Condition) throws
    {
        
    }
}

// MARK: - Flow storage

extension REvent
{
    public func flows() -> [Flow]
    {
        _flows.map { $0 as Flow }
    }
    
    public func append(flow: Flow) throws
    {
        
    }
    
    public func remove(flow: Flow) throws
    {
        
    }
}

// MARK: - History storage

extension REvent
{
    public func history() -> [History]
    {
        _history.map { $0 as History }
    }
    
    public func append(history: History) throws
    {
        
    }
    
    public func history(from: Date, to: Date) throws -> [History]
    {
        return []
    }
}
