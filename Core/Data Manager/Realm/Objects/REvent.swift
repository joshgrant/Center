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
    
    public func conditions() -> [Condition]
    {
        _conditions.map { $0 as Condition }
    }
    
    public func add(condition: Condition) throws
    {
        let condition: RCondition = try condition.unwrap()
        try realm?.write {
            _conditions.append(condition)
        }
    }
    
    public func delete(condition: Condition) throws
    {
        let condition: RCondition = try condition.unwrap()
        
        guard let index = _conditions.index(of: condition) else {
            throw RealmError.noObjectIndex
        }
        
        try realm?.write {
            _conditions.remove(at: index)
        }
    }
    
    public func flows() -> [Flow]
    {
        _flows.map { $0 as Flow }
    }
    
    public func link(flow: Flow) throws
    {
        
    }
    
    public func unlink(flow: Flow) throws
    {
        
    }
    
    public func history() -> [History]
    {
        _history.map { $0 as History }
    }
    
    // TODO: Cache
    public func flowsCount() -> Int
    {
        _flows.count
    }
    
    // TODO: Cache
    public func historyCount() -> Int
    {
        _history.count
    }
    
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
