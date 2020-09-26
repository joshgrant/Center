//
//  Condition.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

class Condition: NSManagedObject
{
    
}

extension Condition: EntityConstructionProtocol
{
    static var entity: NSEntityDescription
    {
        let entity = NSEntityDescription()
        entity.name = String(describing: Self.self)
        
        entity.properties = [
            makeStockAttribute(),
            makeTargetAttribute(),
            makePriorityAttribute(),
            makeRelationshipAttribute()
        ]
        
        return entity
    }
    
    static func makeStockAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "stock"
        attribute.minCount = 1
        attribute.maxCount = 1
        return attribute
    }
    
    static func makeTargetAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "target"
        return attribute
    }
    
    static func makePriorityAttribute() -> NSAttributeDescription
    {
        let attribute = NSAttributeDescription()
        attribute.name = "priority"
        attribute.attributeType = .integer16AttributeType
        return attribute
    }
    
    static func makeRelationshipAttribute() -> NSAttributeDescription
    {
        let attribute = NSAttributeDescription()
        attribute.name = "relationship"
        attribute.attributeType = .integer16AttributeType
        return attribute
    }
}
