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
    
    public func percentIdeal() -> Double { 0 }
    
    // TODO: Cache
    public func suggestedFlows() -> [Flow]
    {
        return []
    }
}

// MARK: - Event storage

extension RSystem
{
    public func events() -> [Event]
    {
        _events.map { $0 as Event }
    }
    
    public func append(event: Event) throws
    {
        
    }
    
    public func remove(event: Event) throws
    {
        
    }
}

// MARK: - Flow storage

extension RSystem
{
    public func flows() -> [Flow]
    {
        _flows.map { $0 as Flow }
    }
    
    public func append(flow: Flow) throws
    {
        
    }
    
    public func remove(flow: Flow) throws
    {
        
    }
}

// MARK: - Note storage

extension RSystem
{
    public func notes() -> [Note]
    {
        _notes.map { $0 as Note }
    }
    
    public func append(note: Note) throws
    {
        
    }
    
    public func remove(note: Note) throws
    {
        
    }
}

// MARK: - Stock storage

extension RSystem
{
    public func stocks() -> [Stock]
    {
        _stocks.map { $0 as Stock }
    }
    
    public func append(stock: Stock) throws
    {
        
    }
    
    public func remove(stock: Stock) throws
    {
        
    }
}
