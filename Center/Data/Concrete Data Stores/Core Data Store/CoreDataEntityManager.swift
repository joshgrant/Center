//
//  CoreDataEntityManager.swift
//  Center
//
//  Created by Joshua Grant on 9/27/20.
//

import Foundation
import CoreData

// TODO: Break apart the extensions into sub-structs
// TODO: Make a struct

class CoreDataEntityManager
{
    static let objectEntity: NSEntityDescription = {
        let entity = NSEntityDescription()
        entity.name = String(describing: BaseObject.self)
        entity.isAbstract = true
        
        entity.subentities = [
            CoreDataEntityManager.eventEntity,
            CoreDataEntityManager.flowEntity,
            CoreDataEntityManager.historyEntity,
            CoreDataEntityManager.noteEntity,
            CoreDataEntityManager.conditionEntity,
        ]
        
        entity.properties = [
            makeTitleAttribute(),
            makeNotesAttribute()
        ]
        
        return entity
    }()
    
    static let eventEntity: NSEntityDescription = {
        let entity = NSEntityDescription()
        entity.name = String(describing: Event.self)
        entity.managedObjectClassName = String(describing: Event.self)
        
        entity.properties = [
            makeIsActiveAttribute(),
            makeConditionsAttribute(),
            makeFlowsAttribute(),
            makeHistoryAttribute(),
            //            makeFlowsCountAttribute(),
            //            makeHistoryCountAttribute()
        ]
        
        return entity
    }()
    
    static let flowEntity: NSEntityDescription = {
        let entity = NSEntityDescription()
        entity.name = String(describing: Flow.self)
        entity.managedObjectClassName = String(describing: Flow.self)
        
        entity.properties = []
        
        return entity
    }()
    
    static let historyEntity: NSEntityDescription = {
        let entity = NSEntityDescription()
        entity.name = String(describing: History.self)
        entity.managedObjectClassName = String(describing: History.self)
        
        entity.properties = []
        
        return entity
    }()
    
    static let noteEntity: NSEntityDescription = {
        let entity = NSEntityDescription()
        entity.name = String(describing: Note.self)
        entity.managedObjectClassName = String(describing: Note.self)
        
        entity.properties = [
            makeContentAttribute()
        ]
        
        return entity
    }()
    
    static let conditionEntity: NSEntityDescription = {
        let entity = NSEntityDescription()
        entity.name = String(describing: Condition.self)
        entity.managedObjectClassName = String(describing: Condition.self)
        
        entity.properties = [
            makeStockAttribute(),
            makeTargetAttribute(),
            makePriorityAttribute(),
            makeRelationshipAttribute()
        ]
        
        return entity
    }()
    
    static let symbolEntity: NSEntityDescription = {
        let entity = NSEntityDescription()
        entity.name = String(describing: Symbol.self)
        entity.managedObjectClassName = String(describing: Symbol.self)
        
        entity.properties = [
            makeStringValueProperty(),
            makeEventsAttribute()
        ]
        
        return entity
    }()
}

// MARK: - Object entity

extension CoreDataEntityManager
{
    static func makeTitleAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "title"
        attribute.deleteRule = .nullifyDeleteRule
        attribute.minCount = 0
        attribute.maxCount = 1
        attribute.destinationEntity = Symbol.entity()
        // TODO: Reverse relationship
        return attribute
    }
    
    static func makeNotesAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "notes"
        attribute.deleteRule = .nullifyDeleteRule
        attribute.minCount = 0
        attribute.maxCount = Int.max
        attribute.destinationEntity = Note.entity()
        // TODO: Reverse relationship
        return attribute
    }
}

// MARK: - Event entity

extension CoreDataEntityManager
{
    static func makeIsActiveAttribute() -> NSAttributeDescription
    {
        let attribute = NSAttributeDescription()
        attribute.name = "isActive"
        attribute.attributeType = .booleanAttributeType
        attribute.defaultValue = true
        attribute.isOptional = false
        return attribute
    }
    
    static func makeConditionsAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "conditions"
        attribute.deleteRule = .nullifyDeleteRule
        attribute.destinationEntity = Condition.entity()
        attribute.minCount = 0
        attribute.maxCount = Int.max
        
        return attribute
    }
    
    static func makeFlowsAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "flows"
        attribute.destinationEntity = Flow.entity()
        attribute.minCount = 0
        attribute.maxCount = Int.max
        return attribute
    }
    
    static func makeHistoryAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "history"
        attribute.destinationEntity = History.entity()
        attribute.minCount = 0
        attribute.maxCount = Int.max
        return attribute
    }
    
    static func makeFlowsCountAttribute() -> NSDerivedAttributeDescription
    {
        let attribute = NSDerivedAttributeDescription()
        attribute.name = "flowsCount"
        attribute.derivationExpression = NSExpression(format: "history.@count")
        return attribute
    }
    
    static func makeHistoryCountAttribute() -> NSDerivedAttributeDescription
    {
        let attribute = NSDerivedAttributeDescription()
        attribute.name = "historyCount"
        attribute.derivationExpression = NSExpression(format: "history.@count")
        return attribute
    }
}

// MARK: - Note entity

extension CoreDataEntityManager
{
    static func makeContentAttribute() -> NSAttributeDescription
    {
        let attribute = NSAttributeDescription()
        attribute.name = "content"
        attribute.attributeType = .stringAttributeType
        return attribute
    }
}

// MARK: - Condition entity

extension CoreDataEntityManager
{
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

// MARK: - Symbol

extension CoreDataEntityManager
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
