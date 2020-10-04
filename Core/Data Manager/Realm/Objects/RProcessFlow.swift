//
//  RProcessFlow.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation
import RealmSwift

open class RProcessFlow: RFlow, ProcessFlow
{
    @objc dynamic public var order: Order = .sequential
    @objc dynamic public var completionType: CompletionType = .children
    
    public func percentComplete() -> Double { 0 }
    
    public var parents = LinkingObjects(fromType: RProcessFlow.self, property: "_steps")
    
    public let _requiredStocks = List<RStock>()
    public let _producedStocks = List<RStock>()
    public let _steps = List<RProcessFlow>()
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
