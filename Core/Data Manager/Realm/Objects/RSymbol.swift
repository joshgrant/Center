//
//  RSymbol.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RSymbol: Object, Symbol
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var name: String?
    
    let _references = List<REntity>()
    let _links = List<REntity>()
    let _notes = List<RNote>()
    
    public func references() -> [Entity] {
        _references.map { $0 as Entity }
    }
}

// MARK: - Link storage

extension RSymbol
{
    public func links() -> [Entity]
    {
        _links.map { $0 as Entity }
    }
    
    public func append(link: Entity) throws
    {
        let link: REntity = try link.unwrap()
        try realm?.write {
            _links.append(link)
        }
    }
    
    public func remove(link: Entity) throws
    {
        let link: REntity = try link.unwrap()
        try realm?.write {
            try _links.remove(object: link)
        }
    }
}

// MARK: - Note storage

extension RSymbol
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
