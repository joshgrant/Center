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
    
    public var linkedColors = LinkingObjects(fromType: RColor.self, property: "symbol")
    public var linkedContacts = LinkingObjects(fromType: RContact.self, property: "symbol")
    public var linkedDimensions = LinkingObjects(fromType: RDimension.self, property: "symbol")
    public var linkedTransferFlows = LinkingObjects(fromType: RTransferFlow.self, property: "symbol")
    public var linkedProcessFlows = LinkingObjects(fromType: RProcessFlow.self, property: "symbol")
    public var linkedNotes = LinkingObjects(fromType: RNote.self, property: "symbol")
    
    public func references() -> [Entity] {
        _references.map { $0 as Entity }
    }
}

// MARK: - Link storage

public extension RSymbol
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

// MARK: - Searchable

extension RSymbol
{
    public static func predicate(for queryString: String) -> NSPredicate
    {
        return makeNamePredicate(queryString)
    }
    
    private static func makeNamePredicate(_ queryString: String) -> NSPredicate
    {
        return NSPredicate(format: "name CONTAINS[cd] %@", queryString)
    }
}
