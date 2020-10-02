//
//  RDimension.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RDimension: Object, Dimension
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    
    private let _units = List<RUnit>()
    private let _notes = List<RNote>()
    
    public func units() -> [Unit] {
        _units.map { $0 as Unit }
    }
    
    public func add(unit: Unit) {
        
    }
    
    public func remove(unit: Unit) {
        
    }
    
    // TODO: Cache
    public func unitsCount() -> Int {
        _units.count
    }
    
    public func notes() -> [Note] {
        _notes.map { $0 as Note }
    }
    
    public func link(note: Note) {
        
    }
    
    public func unlink(note: Note) {
        
    }
}
