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
    
    @objc dynamic public var isPinned: Bool = false
    
    public var conditions = LinkingObjects(fromType: RCondition.self, property: "stock")
    public var transferFlowFrom = LinkingObjects(fromType: RTransferFlow.self, property: "from")
    public var transferFlowTo = LinkingObjects(fromType: RTransferFlow.self, property: "to")
    
    public var processFlowRequired = LinkingObjects(fromType: RProcessFlow.self, property: "_requiredStocks")
    public var processFlowProduced = LinkingObjects(fromType: RProcessFlow.self, property: "_producedStocks")
    
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

public extension RStock
{
    func inflows() -> [Flow]
    {
        _inflows.map { $0 as Flow }
    }
    
    func append(inflow: Flow) throws
    {
        let inflow: RFlow = try inflow.unwrap()
        try realm?.write {
            _inflows.append(inflow)
        }
    }
    
    func remove(inflow: Flow) throws
    {
        let inflow: RFlow = try inflow.unwrap()
        try realm?.write {
            try _inflows.remove(object: inflow)
        }
    }
}

// MARK: - Outflows

public extension RStock
{
    func outflows() -> [Flow]
    {
        _outflows.map { $0 as Flow }
    }
    
    func append(outflow: Flow) throws
    {
        let outflow: RFlow = try outflow.unwrap()
        try realm?.write {
            _outflows.append(outflow)
        }
    }
    
    func remove(outflow: Flow) throws
    {
        let outflow: RFlow = try outflow.unwrap()
        try realm?.write {
            try _outflows.remove(object: outflow)
        }
    }
}

// MARK: - Events

public extension RStock
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

// MARK: - History

public extension RStock
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

public extension RStock
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
