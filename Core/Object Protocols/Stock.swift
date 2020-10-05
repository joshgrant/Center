//
//  Stock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Stock:
    Entity,
    Named,
    EventStorage,
    HistoryStorage,
    NoteStorage,
    Pinnable
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
    func append(inflow: Flow) throws
    func remove(inflow: Flow) throws
    
    /// Query the database (or use the cache) for the outflows from this stock
    /// A match is when the flow's `from` value matches the current stock
    /// The concrete instance of symbol should define a `List<Flow>` property
    func outflows() -> [Flow]
    func append(outflow: Flow) throws
    func remove(outflow: Flow) throws
}
