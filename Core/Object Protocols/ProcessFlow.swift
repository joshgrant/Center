//
//  ProcessFlow.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol ProcessFlow: Flow
{
    var order: Order { get set }
    var completionType: CompletionType { get set }
    
    func percentComplete() -> Double
    
    func requiredStocks() -> [Stock]
    func append(requiredStock: Stock) throws
    func remove(requiredStock: Stock) throws
    
    func producedStocks() -> [Stock]
    func append(producedStock: Stock) throws
    func remove(producedStock: Stock) throws
    
    func steps() -> [ProcessFlow]
    func append(step: ProcessFlow) throws
    func remove(step: ProcessFlow) throws
}
