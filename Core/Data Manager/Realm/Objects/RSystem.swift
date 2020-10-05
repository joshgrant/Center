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
    @objc dynamic public var isPinned: Bool = false
    
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

public extension RSystem
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

// MARK: - Flow storage

public extension RSystem
{
    func flows() -> [Flow]
    {
        _flows.map { $0 as Flow }
    }
    
    func append(flow: Flow) throws
    {
        let flow: RFlow = try flow.unwrap()
        try realm?.write {
            _flows.append(flow)
        }
    }
    
    func remove(flow: Flow) throws
    {
        let flow: RFlow = try flow.unwrap()
        try realm?.write {
            try _flows.remove(object: flow)
        }
    }
    
    /*
     func processFlows() -> [ProcessFlow]
     {
     _processFlows.map { $0 as ProcessFlow }
     }
     
     func append(processFlow: ProcessFlow) throws
     {
     let processFlow: RProcessFlow = try processFlow.unwrap()
     try realm?.write {
     _processFlows.append(processFlow)
     }
     }
     
     func remove(processFlow: ProcessFlow) throws
     {
     let processFlow: RProcessFlow = try processFlow.unwrap()
     try realm?.write {
     try _processFlows.remove(object: processFlow)
     }
     }
     
     func transferFlows() -> [TransferFlow]
     {
     _transferFlows.map { $0 as TransferFlow }
     }
     
     func append(transferFlow: TransferFlow) throws
     {
     let transferFlow: RTransferFlow = try transferFlow.unwrap()
     try realm?.write {
     _transferFlows.append(transferFlow)
     }
     }
     
     func remove(transferFlow: TransferFlow) throws
     {
     let transferFlow: RTransferFlow = try transferFlow.unwrap()
     try realm?.write {
     try _transferFlows.remove(object: transferFlow)
     }
     }
     */
}

// MARK: - Note storage

public extension RSystem
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

// MARK: - Stock storage

public extension RSystem
{
    func stocks() -> [Stock]
    {
        _stocks.map { $0 as Stock }
    }
    
    func append(stock: Stock) throws
    {
        let stock: RStock = try stock.unwrap()
        try realm?.write {
            _stocks.append(stock)
        }
    }
    
    func remove(stock: Stock) throws
    {
        let stock: RStock = try stock.unwrap()
        try realm?.write {
            try _stocks.remove(object: stock)
        }
    }
}
