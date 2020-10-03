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
    
    // TODO: Cache
    public func relatedNotes() -> [Note]
    {
        return []
    }
    
    public func getFirstLink() -> String?
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
    
    public func relatedNotesCount() -> Int
    {
        return 0
    }
}

// MARK: - Link storage

extension RNote
{
    public func links() -> [Entity]
    {
        _links.map { $0 as Entity }
    }
    
    public func append(link: Entity) throws
    {
        
    }
    
    public func remove(link: Entity) throws
    {
        
    }
}

// MARK: - Note storage

extension RNote
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

// MARK: - Block storage

extension RNote
{
    public func blocks() -> [Block]
    {
        _blocks.map { $0 as Block }
    }
    
    public func append(block: Block) throws
    {
        
    }
    
    public func remove(block: Block) throws
    {
        
    }
}
