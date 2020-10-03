//
//  RNote.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RNote: Object, Note
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    
    private let _blocks = List<RBlock>()
    private let _links = List<REntity>()
    private let _notes = List<RNote>()
    
    private let _contacts = LinkingObjects(fromType: RContact.self, property: "_notes")
    private let _dimensions = LinkingObjects(fromType: RDimension.self, property: "_notes")
    private let _entities = LinkingObjects(fromType: REntity.self, property: "_notes")
    private let _events = LinkingObjects(fromType: REvent.self, property: "_notes")
    private let _flows = LinkingObjects(fromType: RFlow.self, property: "_notes")
    private let _units = LinkingObjects(fromType: RUnit.self, property: "_notes")
    
    public func getFirstLine() -> String?
    {
        return nil
    }
    
    public func getSecondLine() -> String?
    {
        return nil
    }
    
    public func getThumbnailImage() -> Any?
    {
        return nil
    }
}

// MARK: - Link storage

public extension RNote
{
    func links() -> [Entity]
    {
        _links.map { $0 as Entity }
    }
    
    func append(link: Entity) throws
    {
        let link: REntity = try link.unwrap()
        try realm?.write {
            _links.append(link)
        }
    }
    
    func remove(link: Entity) throws
    {
        let link: REntity = try link.unwrap()
        try realm?.write {
            try _links.remove(object: link)
        }
    }
}

// MARK: - Note storage

public extension RNote
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

// MARK: - Block storage

public extension RNote
{
    func blocks() -> [Block]
    {
        _blocks.map { $0 as Block }
    }
    
    func append(block: Block) throws
    {
        let block: RBlock = try block.unwrap()
        try realm?.write {
            _blocks.append(block)
        }
    }
    
    func remove(block: Block) throws
    {
        let block: RBlock = try block.unwrap()
        try realm?.write {
            try _blocks.remove(object: block)
        }
    }
}
