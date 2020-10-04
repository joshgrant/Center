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
    @objc dynamic public var contactDelegate: Contact?
    
    public let _events = List<REvent>()
    public let _history = List<RHistory>()
    public let _notes = List<RNote>()
    
    public var linkedStock
}

// MARK: - Event storage

public extension RFlow
{
    func events() -> [Event]
    {
        _events.map { $0 as Event }
    }
    
    func append(event: Event) throws
    {
        let event: REvent = try event.unwrap()
        try realm?.write {
            _events.append(event)
        }
    }
    
    func remove(event: Event) throws
    {
        let event: REvent = try event.unwrap()
        try realm?.write {
            try _events.remove(object: event)
        }
    }
}

// MARK: - Note storage

public extension RFlow
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

// MARK: - History storage

public extension RFlow
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
