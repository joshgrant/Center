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
    NSPredicate(value: false)
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

func makeDateSourcesPredicate() -> NSPredicate
{
    NSPredicate(format: "sourceTypeRaw == %i", SourceType.date.rawValue)
}

func makeDateSourcesFetchRequest() -> NSFetchRequest<DynamicSource>
{
    let fetchRequest: NSFetchRequest<DynamicSource> = DynamicSource.fetchRequest()
    fetchRequest.predicate = makeDateSourcesPredicate()
    return fetchRequest
}

func eventsFromSources(_ sources: [Source]) -> [Event]
{
    var targetEvents: [Event] = sources.flatMap {
        $0.targetOfCondition?.unwrappedEvents ?? []
    }

    let valueEvents = sources.flatMap {
        $0.valueOfCondition?.unwrappedEvents ?? []
    }
    
    targetEvents.append(contentsOf: valueEvents)
    
    return targetEvents
}

@discardableResult func makeDateSource(context: Context) -> DynamicSource
{
    let dateSource = DynamicSource(context: context)
    dateSource.sourceTypeRaw = SourceType.date.rawValue
    return dateSource
}

@discardableResult func makeFutureDateValueSource(context: Context) -> ValueSource
{
    let components = DateComponents(
        calendar: .autoupdatingCurrent,
        year: 2020,
        month: 12,
        day: 2,
        hour: 8,
        minute: 0,
        second: 0)
    let valueSource = ValueSource(context: context)
    valueSource.value = components.date?.timeIntervalSince1970 ?? -1
    return valueSource
}

@discardableResult func makeDateCondition(context: Context,
                                          currentDate: DynamicSource,
                                          futureDate: ValueSource) -> Condition
{
    let condition = Condition(context: context)
    condition.leftHand = futureDate
    condition.rightHand = currentDate
    condition.comparisonType = .greaterThan // The future date is greater than the current date
    return condition
}

@discardableResult func makeDateEvent(context: Context, condition: Condition) -> Event
{
    let event = Event(context: context)
    
    let name = Symbol(context: context)
    name.name = "Birthday Party"
    event.name = name
        
    event.addToConditions(condition)
    return event
}
