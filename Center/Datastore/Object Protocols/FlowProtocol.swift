//
//  FlowProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol FlowProtocol: ObjectProtocol
{
    func getAmount() -> Double
    func getStockFrom() -> StockProtocol
    func getStockTo() -> StockProtocol
    func getDuration() -> Any
    func getDelay() -> Any
    
    func getRequiresUserCompletion() -> Bool
    func setRequiresUserCompletion(_ requiresUserCompletion: Bool)
    
    func getEvents() -> [EventProtocol]
    
    func getHistory() -> [Any]
    
    // MARK: - Caching
    
    func getEventsCount() -> Int
    func getHistoryCount() -> Int
}
