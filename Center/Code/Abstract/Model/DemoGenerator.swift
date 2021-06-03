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

@discardableResult private func makeDefaultFlow(context: Context) -> TransferFlow
{
    let transferFlow = TransferFlow(context: context)
    transferFlow.amount = 7.0
    transferFlow.delay = 4.3
    transferFlow.duration = 6
    transferFlow.from = nil
    transferFlow.to = nil
    transferFlow.isPinned = true
    transferFlow.unwrappedName = "Apple Music Subscription"
    return transferFlow
}

@discardableResult private func makeDefaultStock(context: Context) -> Stock
{
    let stock = Stock(context: context)
    
    stock.title = "Cashews"
    
    let amount = ValueSource(context: context)
    amount.value = 100
    
    let ideal = ValueSource(context: context)
    ideal.value = 50
    
    stock.amount = amount
    stock.ideal = ideal

    return stock
}

public func populateDatabaseWithWaterSystem(context: Context)
{
    makeWaterSystem(context: context)
}

public func populateDatabaseWithFlow(context: Context)
{
    makeDefaultFlow(context: context)
}

public func populateDatabaseWithStock(context: Context)
{
    makeDefaultStock(context: context)
}
