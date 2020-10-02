//
//  Stock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc protocol Stock: Entity
{
    @objc dynamic var amount: Double { get set }
    @objc dynamic var amountType: AmountType { get set }
    @objc dynamic var ideal: Ideal? { get set }
    @objc dynamic var dimension: Dimension? { get set }
    @objc dynamic var unit: Unit? { get set }
    
    func netAmount() -> Net?
    
    /// Query the database (or use the cache) for the inflows to this stock
    /// A match is when the flow's `to` value matches the current stock
    /// The concrete instance of symbol should define a `List<Flow>` property
    func inflows() -> [Flow]
    
    /// Query the database (or use the cache) for the outflows from this stock
    /// A match is when the flow's `from` value matches the current stock
    /// The concrete instance of symbol should define a `List<Flow>` property
    func outflows() -> [Flow]
    
    /// Query the database (or use the cache) for the events that impact this stock
    /// A match is when the event's trigger stock is this stock
    /// The concrete instance of symbol should define a `List<Event>` property
    func events() -> [Event]
    
    func link(event: Event)
    func unlink(event: Event)
    
    /// Returns all history instances associated with this stock
    /// The concrete instance of symbol should define a `List<StockHistory>` property
    func history() -> [StockHistory]
    func add(history: StockHistory)
    
    /// Returns all history instances between the given dates
    func history(from: Date, to: Date) -> [StockHistory]
}

@objc protocol Net
{
    var timePeriod: TimePeriod { get set }
    var amount: Double { get set }
}

@objc protocol StockHistory: History
{
    var amount: Double { get set }
}

@objc enum AmountType: Int, RealmEnum
{
    case Integer
    case Decimal
    case Boolean
}

@objc enum TimePeriod: Int, RealmEnum
{
    case millisecond
    case second
    case minute
    case hour
    case day
    case week
    case month
    case year
}
