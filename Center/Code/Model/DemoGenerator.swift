//
//  DemoGenerator.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

@discardableResult private func makeDynamicDateSource(context: Context) -> DynamicSource
{
    let dateSource = DynamicSource(context: context)
    dateSource.sourceTypeRaw = SourceType.date.rawValue
    return dateSource
}

@discardableResult private func makeValueDateSource(context: Context, year: Int, month: Int, day: Int) -> ValueSource
{
    let components = DateComponents(
        calendar: .autoupdatingCurrent,
        year: year,
        month: month,
        day: day)
    let valueSource = ValueSource(context: context)
    valueSource.value = components.date?.timeIntervalSince1970 ?? -1
    return valueSource
}

@discardableResult private func makeDateCondition(context: Context,
                                                  currentDate: DynamicSource,
                                                  comparison: Comparison,
                                                  futureDate: ValueSource) -> Condition
{
    let condition = Condition(context: context)
    condition.leftHand = futureDate
    condition.comparisonType = comparison
    condition.rightHand = currentDate
    return condition
}

@discardableResult private func makeDateEvent(context: Context,
                                              name: String,
                                              condition: Condition) -> Event
{
    let event = Event(context: context)
    event.unwrappedName = name
    event.addToConditions(condition)
    return event
}

public func populateDatabaseWithBirthdayPartyEvent(context: Context)
{
    let currentDate = makeDynamicDateSource(context: context)
    let futureDate = makeValueDateSource(
        context: context,
        year: 2020,
        month: 12,
        day: 25)
    let dateCondition = makeDateCondition(
        context: context,
        currentDate: currentDate,
        comparison: .greaterThan,
        futureDate: futureDate)
    makeDateEvent(context: context, name: "Birthday Party", condition: dateCondition)
}

@discardableResult private func makeWaterSystem(context: Context) -> System
{
    let system = System(context: context)
    system.unwrappedName = "Water"
    system.isPinned = true
    return system
}

public func populateDatabaseWithWaterSystem(context: Context)
{
    makeWaterSystem(context: context)
}
