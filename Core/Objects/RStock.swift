//
//  RStock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc class RStock: Object, Stock
{
    @objc dynamic var amount: Double = 0
    @objc dynamic var amountType: AmountType = .Integer
    @objc dynamic var ideal: Ideal?
    @objc dynamic var dimension: Dimension?
    @objc dynamic var unit: Unit?
    @objc dynamic var id: UUID = .init()
    @objc dynamic var symbol: Symbol?
    
    var _inflows: List<RFlow>!
    var _outflows: List<RFlow>!
    
    func netAmount() -> Net? {
        return nil
    }
    
    func inflows() -> [Flow] {
        return []
    }
    
    func outflows() -> [Flow] {
        return []
    }
    
    func events() -> [Event] {
        return []
    }
    
    func link(event: Event) {
        
    }
    
    func unlink(event: Event) {
        
    }
    
    func history() -> [StockHistory] {
        return []
    }
    
    func add(history: StockHistory) {
        
    }
    
    func history(from: Date, to: Date) -> [StockHistory] {
        return []
    }
    
    func notes() -> [Note] {
        return []
    }
    
    func link(note: Note) {
        
    }
    
    func unlink(note: Note) {
        
    }
}
