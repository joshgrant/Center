//
//  RStock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RStock: Object, Stock
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    
    @objc dynamic public var amount: Double = 0
    @objc dynamic public var amountType: AmountType = .Integer
    @objc dynamic public var ideal: Ideal?
    @objc dynamic public var dimension: Dimension?
    @objc dynamic public var unit: Unit?
    
    private let _inflows = List<RFlow>()
    private let _outflows = List<RFlow>()
    private let _events = List<REvent>()
    private let _history = List<RStockHistory>()
    private let _notes = List<RNote>()
    
    public func netAmount() -> Net? {
        return nil
    }
    
    public func inflows() -> [Flow] {
        _inflows.map { $0 as Flow }
    }
    
    public func outflows() -> [Flow] {
        _outflows.map { $0 as Flow }
    }
    
    public func events() -> [Event] {
        _events.map { $0 as Event }
    }
    
    public func link(event: Event) {
        
    }
    
    public func unlink(event: Event) {
        
    }
    
    public func history() -> [StockHistory] {
        _history.map { $0 as StockHistory }
    }
    
    public func add(history: StockHistory) {
        
    }
    
    public func history(from: Date, to: Date) -> [StockHistory] {
        return []
    }
    
    public func notes() -> [Note] {
        _notes.map { $0 as Note }
    }
    
    public func link(note: Note) {
        
    }
    
    public func unlink(note: Note) {
        
    }
}
