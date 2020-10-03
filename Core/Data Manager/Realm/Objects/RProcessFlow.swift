//
//  RProcessFlow.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation
import RealmSwift

open class RProcessFlow: Object, ProcessFlow
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    @objc dynamic public var order: Order = .sequential
    @objc dynamic public var completionType: CompletionType = .children
    @objc dynamic public var amount: Double = 0
    @objc dynamic public var contactDelegate: Contact?
    
    public func percentComplete() -> Double { 0 }
    
    private let _requiredStocks = List<RStock>()
    private let _producedStocks = List<RStock>()
    private let _steps = List<RProcessFlow>()
    private let _events = List<REvent>()
    private let _notes = List<RNote>()
    private let _history = List<RHistory>()
}

// MARK: - Required stock storage

public extension RProcessFlow
{
    func requiredStocks() -> [Stock]
    {
        _requiredStocks.map { $0 as Stock }
    }
    
    func append(requiredStock: Stock) throws
    {
        
    }
    
    func remove(requiredStock: Stock) throws
    {
        
    }
}

// MARK: - Produced stock storage

public extension RProcessFlow
{
    func producedStocks() -> [Stock]
    {
        _producedStocks.map { $0 as Stock }
    }
    
    func append(producedStock: Stock) throws
    {
        
    }
    
    func remove(producedStock: Stock) throws
    {
        
    }
}

// MARK: - Event storage

public extension RProcessFlow
{
    func events() -> [Event]
    {
        _events.map { $0 as Event }
    }
    
    func append(event: Event) throws
    {
        
    }
    
    func remove(event: Event) throws
    {
        
    }
}

// MARK: - Note storage

public extension RProcessFlow
{
    func notes() -> [Note]
    {
        _notes.map { $0 as Note }
    }
    
    func append(note: Note) throws
    {
        
    }
    
    func remove(note: Note) throws
    {
        
    }
}

// MARK: - History storage

public extension RProcessFlow
{
    func history() -> [History]
    {
        _history.map { $0 as History }
    }
    
    func append(history: History) throws
    {
        
    }
    
    func history(from: Date, to: Date) throws -> [History]
    {
        return []
    }
}

// MARK: - Process flow storage

public extension RProcessFlow
{
    func steps() -> [ProcessFlow]
    {
        _steps.map { $0 as ProcessFlow }
    }
    
    func append(step: ProcessFlow) throws
    {
        
    }
    
    func remove(step: ProcessFlow) throws
    {
        
    }
}
