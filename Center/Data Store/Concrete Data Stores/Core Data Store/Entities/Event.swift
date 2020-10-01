//
//  Event.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData
import Architecture

@objc(Event)
public class Event: BaseObject
{
    @NSManaged public var isActive: Bool
    @NSManaged public var conditions: Set<Condition>
    @NSManaged public var flows: Set<Flow>
    @NSManaged public var history: Set<History>
    
    public class func request() -> NSFetchRequest<Event>
    {
        // TODO: Don't want to hardcode this...
        return NSFetchRequest<Event>(entityName: "Event")
    }

    public override class func entity() -> NSEntityDescription
    {
        return CoreDataEntityManager.eventEntity
    }
}

extension Event: TableViewCellModel
{
    public var cellClass: AnyClass { EventTableViewCell.self }
}

extension Event: EventProtocol
{
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

/*
 //
 //  Machine+CoreDataProperties.swift
 //  Flow
 //
 //  Created by Joshua Grant on 9/27/20.
 //  Copyright © 2020 Joshua Grant. All rights reserved.
 //
 //
 
 import Foundation
 import CoreData
 
 
 extension Machine {
 
 @nonobjc public class func fetchRequest() -> NSFetchRequest<Machine> {
 return NSFetchRequest<Machine>(entityName: "Machine")
 }
 
 @NSManaged public var name: String?
 @NSManaged public var blocks: NSSet?
 @NSManaged public var children: NSSet?
 @NSManaged public var current: State?
 @NSManaged public var flows: NSSet?
 @NSManaged public var ideal: State?
 @NSManaged public var parent: Machine?
 @NSManaged public var states: NSSet?
 
 }
 
 // MARK: Generated accessors for blocks
 extension Machine {
 
 @objc(addBlocksObject:)
 @NSManaged public func addToBlocks(_ value: Flow)
 
 @objc(removeBlocksObject:)
 @NSManaged public func removeFromBlocks(_ value: Flow)
 
 @objc(addBlocks:)
 @NSManaged public func addToBlocks(_ values: NSSet)
 
 @objc(removeBlocks:)
 @NSManaged public func removeFromBlocks(_ values: NSSet)
 
 }
 
 // MARK: Generated accessors for children
 extension Machine {
 
 @objc(addChildrenObject:)
 @NSManaged public func addToChildren(_ value: Machine)
 
 @objc(removeChildrenObject:)
 @NSManaged public func removeFromChildren(_ value: Machine)
 
 @objc(addChildren:)
 @NSManaged public func addToChildren(_ values: NSSet)
 
 @objc(removeChildren:)
 @NSManaged public func removeFromChildren(_ values: NSSet)
 
 }
 
 // MARK: Generated accessors for flows
 extension Machine {
 
 @objc(addFlowsObject:)
 @NSManaged public func addToFlows(_ value: Flow)
 
 @objc(removeFlowsObject:)
 @NSManaged public func removeFromFlows(_ value: Flow)
 
 @objc(addFlows:)
 @NSManaged public func addToFlows(_ values: NSSet)
 
 @objc(removeFlows:)
 @NSManaged public func removeFromFlows(_ values: NSSet)
 
 }
 
 // MARK: Generated accessors for states
 extension Machine {
 
 @objc(addStatesObject:)
 @NSManaged public func addToStates(_ value: State)
 
 @objc(removeStatesObject:)
 @NSManaged public func removeFromStates(_ value: State)
 
 @objc(addStates:)
 @NSManaged public func addToStates(_ values: NSSet)
 
 @objc(removeStates:)
 @NSManaged public func removeFromStates(_ values: NSSet)
 
 }

 */
