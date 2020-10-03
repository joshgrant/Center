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
        let requiredStock: RStock = try requiredStock.unwrap()
        try realm?.write {
            _requiredStocks.append(requiredStock)
        }
    }
    
    func remove(requiredStock: Stock) throws
    {
        let requiredStock: RStock = try requiredStock.unwrap()
        try realm?.write {
            try _requiredStocks.remove(object: requiredStock)
        }
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
        let producedStock: RStock = try producedStock.unwrap()
        try realm?.write {
            _producedStocks.append(producedStock)
        }
    }
    
    func remove(producedStock: Stock) throws
    {
        let producedStock: RStock = try producedStock.unwrap()
        try realm?.write {
            try _producedStocks.remove(object: producedStock)
        }
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
        let event: REvent = try event.unwrap()
        try realm?.write {
            _events.append(event)
        }
    }
    
    func remove(event: Event) throws
    {
        let event: REvent = try event.unwrap()
        try realm?.write {
            try _events.remove(object: event)
        }
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
        let note: RNote = try note.unwrap()
        try realm?.write {
            _notes.append(note)
        }
    }
    
    func remove(note: Note) throws
    {
        let note: RNote = try note.unwrap()
        try realm?.write {
            try _notes.remove(object: note)
        }
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
        let history: RHistory = try history.unwrap()
        try realm?.write {
            _history.append(history)
        }
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
        let step: RProcessFlow = try step.unwrap()
        try realm?.write {
            _steps.append(step)
        }
    }
    
    func remove(step: ProcessFlow) throws
    {
        let step: RProcessFlow = try step.unwrap()
        try realm?.write {
            try _steps.remove(object: step)
        }
    }
}
