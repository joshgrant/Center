//
//  Event.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData
import Architecture

class Event: NSManagedObject
{
    @NSManaged var title: Symbol
    @NSManaged var isActive: Bool
    @NSManaged var conditions: Set<Condition>
    @NSManaged var flows: Set<Flow>
    @NSManaged var history: Set<History>
    
    static let entity: NSEntityDescription = {
        let entity = NSEntityDescription()
        entity.name = String(describing: Event.self)
        
        entity.properties = [
            makeTitleAttribute(),
            makeIsActiveAttribute(),
            makeConditionsAttribute(),
            makeFlowsAttribute(),
            makeHistoryAttribute(),
            //            makeFlowsCountAttribute(),
            //            makeHistoryCountAttribute()
        ]
        
        return entity
    }()
}

extension Event: EntityConstructionProtocol
{
    static func makeTitleAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "title"
        attribute.deleteRule = .nullifyDeleteRule
        attribute.minCount = 0
        attribute.maxCount = 1
        attribute.destinationEntity = Symbol.entity
        return attribute
    }
    
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
        attribute.destinationEntity = Condition.entity
        attribute.minCount = 0
        attribute.maxCount = Int.max
        
        return attribute
    }
    
    static func makeFlowsAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "flows"
        attribute.destinationEntity = Flow.entity
        attribute.minCount = 0
        attribute.maxCount = Int.max
        return attribute
    }
    
    static func makeHistoryAttribute() -> NSRelationshipDescription
    {
        let attribute = NSRelationshipDescription()
        attribute.name = "history"
        attribute.destinationEntity = History.entity
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

extension Event: TableViewCellModel
{
    var cellClass: AnyClass? { EventTableViewCell.self }
}

extension Event: EventProtocol
{
    func getSymbol() -> SymbolProtocol {
        return Symbol()
    }
    
    func setSymbol(_ symbol: SymbolProtocol) {
        
    }
    
    func getNotes() -> [NoteProtocol] {
        return []
    }
    
    func linkNote(_ note: NoteProtocol) {
        
    }
    
    func getNotesCount() -> Int {
        return 0
    }
    
    func linkFlow(_ flow: FlowProtocol) {
        
    }
    
    func unlinkFlow(_ flow: FlowProtocol) {
        
    }
    
    func getIsActive() -> Bool {
        return true
    }
    
    func setIsActive(_ isActive: Bool) {
        
    }
    
    func getConditions() -> [Any] {
        return []
    }
    
    func getFlows() -> [FlowProtocol] {
        return []
    }
    
    func getHistory() -> [Any] {
        return []
    }
    
    func getFlowsCount() -> Int {
        return 0
    }
    
    func getHistoryCount() -> Int {
        return 0
    }
}
