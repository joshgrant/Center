//
//  RContact.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RContact: Object, Contact
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    @objc dynamic public var name: String?
    @objc dynamic public var phoneNumber: String?
    @objc dynamic public var email: String?
    @objc dynamic public var isPinned: Bool = false
    
    let _notes = List<RNote>()
    
    public var transferFlows = LinkingObjects(fromType: RTransferFlow.self, property: "contactDelegate")
    public var processFlows = LinkingObjects(fromType: RProcessFlow.self, property: "contactDelegate")
}

// MARK: - Note storage

public extension RContact
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
