//
//  Symbol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

class Symbol: NSManagedObject
{
    @NSManaged var stringValue: String
    @NSManaged var events: Set<Event>
    
    static let entity: NSEntityDescription = {
        let entity = NSEntityDescription()
        entity.name = String(describing: Symbol.self)
        
        entity.properties = [
            makeStringValueProperty(),
            makeEventsAttribute()
        ]
        
        return entity
    }()
}

extension Symbol: EntityConstructionProtocol
{
    static func makeStringValueProperty() -> NSAttributeDescription
    {
        let attribute = NSAttributeDescription()
        attribute.name = "stringValue"
        attribute.attributeType = .stringAttributeType
        return attribute
    }
    
    static func makeEventsAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "events"
        attribute.deleteRule = .noActionDeleteRule
        attribute.minCount = 0
        attribute.maxCount = Int.max
        return attribute
    }
}

extension Symbol: SymbolProtocol
{
    func getStringValue() -> String {
        return ""
    }
    
    func setStringValue(_ stringValue: String) {
        
    }
    
    func getDirectReferences() -> [Any] {
        return []
    }
    
    func getLinks() -> [Any] {
        return []
    }
    
    func addLink(_ link: Any) {
        
    }
    
    func getNotes() -> [NoteProtocol] {
        return []
    }
    
    func linkNote(_ note: NoteProtocol) {
        
    }
    
    func getLinksCount() -> Int {
        return 0
    }
    
    func getNotesCount() -> Int {
        return 0
    }
}
