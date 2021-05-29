//
//  EntityType.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import UIKit
import CoreData

public enum EntityType: Int
{
    case nonEntity
    case system
    case stock
    case flow
    case process
    case event
    case conversion
    case condition
    case dimension
    case unit
    case symbol
    case note
}

extension EntityType: CaseIterable {}

public func titleForEntityType(_ entityType: EntityType) -> String {
    switch entityType
    {
    case .system:
        return "Systems"
    case .stock:
        return "Stocks"
    case .flow:
        return "Flows"
    case .event:
        return "Events"
    case .conversion:
        return "Conversions"
    case .dimension:
        return "Dimensions"
    case .symbol:
        return "Symbols"
    case .note:
        return "Notes"
    case .process:
        return "Process"
    case .condition:
        return "Condition"
    case .unit:
        return "Unit"
    case .nonEntity: return "Non Entity"
    }
}

public func imageForEntityType(_ entityType: EntityType) -> UIImage? {
    switch entityType
    {
    case .system:
        return UIImage(icon: .system)
    case .stock:
        return UIImage(icon: .stock)
    case .flow:
        return UIImage(icon: .flow)
    case .event:
        return UIImage(icon: .event)
    case .conversion:
        return UIImage(icon: .conversion)
    case .dimension:
        return UIImage(icon: .dimension)
    case .symbol:
        return UIImage(icon: .symbol)
    case .note:
        return UIImage(icon: .note)
    case .process:
        return UIImage(icon: .process)
    case .condition:
        return UIImage(icon: .condition)
    case .unit:
        return UIImage(icon: .unit)
    case .nonEntity:
        return UIImage(icon: .question)
    }
}

public func managedObjectType(for entityType: EntityType) -> NSManagedObject.Type
{
    switch entityType
    {
    case .system, .nonEntity:
        return System.self
    case .stock:
        return Stock.self
    case .flow:
        return TransferFlow.self
    case .event:
        return Event.self
    case .conversion:
        return Conversion.self
    case .dimension:
        return Dimension.self
    case .symbol:
        return Symbol.self
    case .note:
        return Note.self
    case .process:
        return ProcessFlow.self
    case .condition:
        return Condition.self
    case .unit:
        return Unit.self
    }
}

public func addObject(of entityType: EntityType, into context: Context) -> Entity
{
    switch entityType
    {
    case .system:
        return System(context: context)
    case .stock:
        return Stock(context: context)
    case .flow:
        return TransferFlow(context: context)
    case .event:
        return Event(context: context)
    case .conversion:
        return Conversion(context: context)
    case .dimension:
        return Dimension(context: context)
    case .symbol:
        return Symbol(context: context)
    case .note:
        return Note(context: context)
    case .process:
        return ProcessFlow(context: context)
    case .condition:
        return Condition(context: context)
    case .unit:
        return Unit(context: context)
    case .nonEntity:
        return System(context: context) // TODO: Maybe not good?
    }
}

public func countForEntityType(_ entityType: EntityType, context: Context) -> Int
{
    let objectType = managedObjectType(for: entityType)
    let request = objectType.fetchRequest()
    request.includesPropertyValues = false
    request.includesSubentities = false
    do {
        return try context.fetch(request).count
    } catch {
        assertionFailure(error.localizedDescription)
        return 0
    }
}
