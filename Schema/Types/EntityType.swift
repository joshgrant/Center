//
//  EntityType.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import UIKit
import CoreData

enum EntityType
{
    case system
    case stock
    case flow
    case event
    case conversion
    case dimension
    case symbol
    case note
}

extension EntityType: CaseIterable
{
    
}

func titleForEntityType(_ entityType: EntityType) -> String {
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
    }
}

func imageForEntityType(_ entityType: EntityType) -> UIImage? {
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
    }
}

func managedObjectType(for entityType: EntityType) -> NSManagedObject.Type
{
    switch entityType
    {
    case .system:
        return System.self
    case .stock:
        return Stock.self
    case .flow:
        return Flow.self
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
    }
}

func addObject(of entityType: EntityType, into context: Context) -> Entity
{
    switch entityType
    {
    case .system:
        return System(context: context)
    case .stock:
        return Stock(context: context)
    case .flow:
        return Flow(context: context)
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
    }
}

func countForEntityType(_ entityType: EntityType, context: Context) throws -> Int
{
    let objectType = managedObjectType(for: entityType)
    let request = objectType.fetchRequest()
    request.includesPropertyValues = false
    request.includesSubentities = false
    return try context.fetch(request).count
}

func libraryListCellModel(for entityType: EntityType, context: Context) throws -> LibraryListCellModel
{
    LibraryListCellModel(
        image: imageForEntityType(entityType),
        title: titleForEntityType(entityType),
        count: try countForEntityType(entityType, context: context))
}
