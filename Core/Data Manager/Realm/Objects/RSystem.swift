//
//  RSystem.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RSystem: Object, System
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    
    private let _stocks = List<RStock>()
    private let _flows = List<RFlow>()
    private let _events = List<REvent>()
    private let _notes = List<RNote>()
    
    public func percentIdeal() -> Double
    {
        0
    }
    
    // TODO: Cache
    public func suggestedFlows() -> [Flow]
    {
        return []
    }
    
    public func stocks() -> [Stock]
    {
        _stocks.map { $0 as Stock }
    }
    
    public func link(stock: Stock)
    {
        
    }
    
    public func flows() -> [Flow]
    {
        _flows.map { $0 as Flow }
    }
    
    public func link(flow: Flow)
    {
        
    }
    
    public func events() -> [Event]
    {
        _events.map { $0 as Event }
    }
    
    public func link(event: Event)
    {
        
    }
    
    public func notes() -> [Note]
    {
        _notes.map { $0 as Note }
    }
    
    public func link(note: Note) throws
    {
        
    }
    
    public func unlink(note: Note) throws
    {
        
    }
}
