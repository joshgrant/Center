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
    @objc dynamic public var name: String?
    
    let _references = List<REntity>()
    let _links = List<REntity>()
    let _notes = List<RNote>()
    
    public func references() -> [Entity] {
        _references.map { $0 as Entity }
    }
    
    public func links() -> [Entity] {
        _links.map { $0 as Entity }
    }
    
    public func add(link: Entity) {
        
    }
    
    public func notes() -> [Note] {
        _notes.map { $0 as Note }
    }
    
    public func add(note: Note) {
        
    }
    
    public func unlink(note: Note) {
        
    }
}
