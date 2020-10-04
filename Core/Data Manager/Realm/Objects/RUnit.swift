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
    
    // TODO: Check that the naming makes sense
    public var convertsFrom = LinkingObjects(fromType: RConversion.self, property: "from")
    public var convertsTo = LinkingObjects(fromType: RConversion.self, property: "to")

    public var dimensions = LinkingObjects(fromType: RUnit.self, property: "_units")
    public var linkedStocks = LinkingObjects(fromType: RUnit.self, property: "unit")
}

// MARK: - Note storage

public extension RUnit
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
