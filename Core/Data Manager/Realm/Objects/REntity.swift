//
//  REntity.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class REntity: Object, Entity
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    
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
