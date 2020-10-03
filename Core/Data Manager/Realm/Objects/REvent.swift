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
}

// MARK: - Condition storage

public extension REvent
{
    func conditions() -> [Condition]
    {
        _conditions.map { $0 as Condition }
    }
    
    func append(condition: Condition) throws
    {
        let condition: RCondition = try condition.unwrap()
        try realm?.write {
            _conditions.append(condition)
        }
    }
    
    func remove(condition: Condition) throws
    {
        let condition: RCondition = try condition.unwrap()
        try realm?.write {
            try _conditions.remove(object: condition)
        }
    }
}

// MARK: - Flow storage

public extension REvent
{
    func flows() -> [Flow]
    {
        _flows.map { $0 as Flow }
    }
    
    func append(flow: Flow) throws
    {
        let flow: RFlow = try flow.unwrap()
        try realm?.write {
            _flows.append(flow)
        }
    }
    
    func remove(flow: Flow) throws
    {
        let flow: RFlow = try flow.unwrap()
        try realm?.write {
            try _flows.remove(object: flow)
        }
    }
}

// MARK: - History storage

public extension REvent
{
    func history() -> [History]
    {
        _history.map { $0 as History }
    }
    
    func append(history: History) throws
    {
        let history: RHistory = try history.unwrap()
        try realm?.write {
            _history.append(history)
        }
    }
    
    func history(from: Date, to: Date) throws -> [History]
    {
        return []
    }
}

// MARK: - Note storage

public extension REvent
{
    func notes() -> [Note]
    {
        _notes.map { $0 as Note }
    }
    
    func append(note: Note) throws
    {
        let note: RNote = try note.unwrap()
        try realm?.write {
            _notes.append(note)
        }
    }
    
    func remove(note: Note) throws
    {
        let note: RNote = try note.unwrap()
        try realm?.write {
            try _notes.remove(object: note)
        }
    }
}
