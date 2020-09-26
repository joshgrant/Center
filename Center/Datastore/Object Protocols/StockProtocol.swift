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
    func getDimension() -> Any
    
    func getCurrentAmount() -> Double
    func getCurrentState() -> Any?
    
    func getNetAmount() -> Any
    
    func getStates() -> [Any]
    
    func getInflows() -> [Any]
    func getOutflows() -> [Any]
    
    func getEventOverviews() -> [EventOverviewProtocol]
    func linkEvent(_ event: Event)
    func unlinkEvent(_ event: Event)
    
    func getAmounts(from: Date, to: Date) -> [Any] // Each amount needs a date
    
    func getHistoryOverviews() -> [Any]
}

protocol StockOverviewProtocol: ObjectProtocol
{
    // TODO: Name and either the value, or the state
}
