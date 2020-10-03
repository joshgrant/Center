//
//  RStock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RStock:
    Object,
    Stock
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
    private let _history = List<RHistory>()
    private let _notes = List<RNote>()
    
    public func netAmount() -> Net?
    {
        return nil
    }
}

// MARK: - Inflows

extension RStock
{
    public func inflows() -> [Flow]
    {
        _inflows.map { $0 as Flow }
    }
    
    public func append(inflow: Flow) throws
    {
        let inflow: RFlow = try inflow.unwrap()
        try realm?.write {
            _inflows.append(inflow)
        }
    }
    
    public func remove(inflow: Flow) throws
    {
        let inflow: RFlow = try inflow.unwrap()
        try realm?.write {
            try _inflows.remove(object: inflow)
        }
    }
}

// MARK: - Outflows

extension RStock
{
    public func outflows() -> [Flow]
    {
        _outflows.map { $0 as Flow }
    }
    
    public func append(outflow: Flow) throws
    {
        let outflow: RFlow = try outflow.unwrap()
        try realm?.write {
            _outflows.append(outflow)
        }
    }
    
    public func remove(outflow: Flow) throws
    {
        let outflow: RFlow = try outflow.unwrap()
        try realm?.write {
            try _outflows.remove(object: outflow)
        }
    }
}

// MARK: - Events

extension RStock
{
    public func events() -> [Event]
    {
        _events.map { $0 as Event }
    }
    
    public func append(event: Event) throws
    {
        let event: REvent = try event.unwrap()
        try realm?.write {
            _events.append(event)
        }
    }
    
    public func remove(event: Event) throws
    {
        let event: REvent = try event.unwrap()
        try realm?.write {
            try _events.remove(object: event)
        }
    }
}

// MARK: - History

extension RStock
{
    public func history() -> [History]
    {
        _history.map { $0 as History }
    }
    
    public func append(history: History) throws
    {
        let history: RHistory = try history.unwrap()
        try realm?.write {
            _history.append(history)
        }
    }
    
    public func history(from: Date, to: Date) throws -> [History]
    {
        return []
    }
}

extension RStock
{
    public func notes() -> [Note]
    {
        _notes.map { $0 as Note }
    }
    
    public func append(note: Note) throws
    {
        let note: RNote = try note.unwrap()
        try realm?.write {
            _notes.append(note)
        }
    }
    
    public func remove(note: Note) throws
    {
        let note: RNote = try note.unwrap()
        try realm?.write {
            try _notes.remove(object: note)
        }
    }
}
