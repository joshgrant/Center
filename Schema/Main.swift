//
//  Main.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation
import CoreData

/**
 
 Structs contain state
 Classes contain variables
 Functions contain functions
 
 */

enum SourceType: Int16
{
    case date
    case uptime
    case timeSinceLaunch
    case timeSinceDownload
    case timeSinceForeground
    
    var name: String {
        switch self {
        case .date: return "date"
        case .uptime: return "uptime"
        case .timeSinceLaunch: return "timeSinceLaunch"
        case .timeSinceDownload: return "timeSinceDownload"
        case .timeSinceForeground: return "timeSinceForeground"
        }
    }
}

struct SymbolConstructor
{
    var context: Context
    
    var id: UUID = .init()
    var name: String
    var isPinned: Bool
}

func makeSymbol(with constructor: SymbolConstructor)
{
    // TODO: This should be codable...
    let symbol = Symbol(context: constructor.context)
    symbol.id = constructor.id
    symbol.name = constructor.name
    symbol.isPinned = constructor.isPinned
}

func makeUpcomingEventsPredicate() -> NSPredicate
{
    // All events
    // Not hidden
    // With at least 1 condition
    // Where the condition
    // has a leftHand of the current date
    // and a rightHand in the future
    // And a comparison type of <, or <=
    
    // Or the condition
    // has a leftHand of the future
    // and a rightHand of the current date
    // And a comparison type of >, or >=
    
//    let nonHiddenEventsPredicate = NSPredicate(format: "isHidden == %@", false)
//    let
    
    let event = Event()
    let conditions = event.conditions as? Set<Condition>
    let results = conditions?.filter { condition -> Bool in
//        switch condition.leftHand {
//        case is DynamicSource:
//
//        case is RangeSource:
//        case is StockSource:
//        case is SystemSource:
//        case is ValueSource:
//        }
        
        let leftIsDate: Bool
        let leftValue: Double
        
        if let leftHand = condition.leftHand as? DynamicSource {
            leftIsDate = leftHand.sourceTypeRaw == SourceType.date.rawValue
            leftValue = Date().timeIntervalSince1970
        } else if let leftHand = condition.leftHand as? RangeSource {
            leftIsDate = false
//            leftValue = leftHand.max
        } else if let leftHand = condition.leftHand as? StockSource {
            leftIsDate = false
            leftValue = (leftHand.stock?.amount as? ValueSource)?.value ?? 0
        } else if let leftHand = condition.leftHand as? SystemSource {
            leftIsDate = false
//            leftValue = leftHand.system?.ideal.
        } else if let leftHand = condition.leftHand as? ValueSource {
            leftIsDate = false
            leftValue = leftHand.value
        }
        
        let rightIsDate: Bool
        let rightValue: Double
        
        if let rightHand = condition.rightHand as? DynamicSource {
            
        } else if let rightHand = condition.rightHand as? ValueSource {
            
        } else
    }
}

func makeUpcomingEventsFetchRequest() -> NSFetchRequest<Event>
{
    let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
    fetchRequest.predicate = makeUpcomingEventsPredicate()
    return fetchRequest
}

func performFetchRequest<T>(fetchRequest: NSFetchRequest<T>, dataManager: DataManager) -> [T]
{
    do {
        let result = try dataManager.context.fetch(fetchRequest)
        return result
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}
