//
//  StockProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol StockProtocol: ObjectProtocol
{
    // Remember, stocks can be dynamic and measure other parts of the app,
    // such a system's current value, or other stocks
    
    func getAmountType() -> Any
    func getStateType() -> Any
    func getDimension() -> DimensionProtocol
    
    func getCurrentAmount() -> Double
    func getCurrentState() -> Any?
    
    func getNetAmount() -> Any
    
    func getStates() -> [Any]
    
    func getInflows() -> [FlowProtocol]
    func getOutflows() -> [FlowProtocol]
    
    func getEvent() -> [EventProtocol]
    func linkEvent(_ event: EventProtocol)
    func unlinkEvent(_ event: EventProtocol)
    
    func getAmounts(from: Date, to: Date) -> [Any] // Each amount needs a date
    
    func getHistory() -> [Any]
    
    // MARK: - Caching
    
    func getInflowsCount() -> Int
    func getOutflowsCount() -> Int
    func getEventsCount() -> Int
    func getHistoryCount() -> Int
}
