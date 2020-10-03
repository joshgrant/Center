//
//  RUnit.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RUnit: Object, Unit
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    @objc dynamic public var isBaseUnit: Bool = true
    @objc dynamic public var relativeTo: Unit?
    @objc dynamic public var ratio: Ratio?
    
    public let _notes = List<RNote>()
}

// MARK: - Note storage

extension RUnit
{
    public func notes() -> [Note]
    {
        _notes.map { $0 as Note }
    }
    
    public func append(note: Note) throws
    {
        let note: RNote = try note.unwrap()
        try realm?.write {
            _notes.append(note)
        }
    }
    
    public func remove(note: Note) throws
    {
        let note: RNote = try note.unwrap()
        try realm?.write {
            try _notes.remove(object: note)
        }
    }
}
