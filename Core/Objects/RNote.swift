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
    
    public func blocks() -> [Block] {
        _blocks.map { $0 as Block }
    }
    
    public func add(block: Block) {
        
    }
    
    public func delete(block: Block) {
        
    }
    
    public func links() -> [Entity] {
        _links.map { $0 as Entity }
    }
    
    public func link(entity: Entity) {
        
    }
    
    public func unlink(entity: Entity) {
        
    }
    
    // TODO: Cache
    public func relatedNotes() -> [Note] {
        return []
    }
    
    public func getFirstLink() -> String? {
        return nil
    }
    
    public func getSecondLine() -> String? {
        return nil
    }
    
    public func getThumbnailImage() -> Any? {
        return nil
    }
    
    // TODO: Cache
    public func linksCount() -> Int {
        _links.count
    }
    
    public func relatedNotesCount() -> Int {
        return 0
    }
    
    public func notes() -> [Note] {
        _notes.map { $0 as Note }
    }
    
    public func link(note: Note) {
        
    }
    
    public func unlink(note: Note) {
    
    }
}
