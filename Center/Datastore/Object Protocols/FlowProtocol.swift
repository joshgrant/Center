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
    func getStockFrom() -> StockOverviewProtocol
    func getStockTo() -> StockOverviewProtocol
    func getDuration() -> Any
    func getDelay() -> Any
    
    func getRequiresUserCompletion() -> Bool
    func setRequiresUserCompletion(_ requiresUserCompletion: Bool)
    
    func getEventOverviews() -> [EventOverviewProtocol]
    
    func getHistoryOverviews() -> [Any]  
}

protocol FlowOverviewProtocol: ObjectProtocol
{
    // TODO: Name, from, to, amount
    
    // Should have a reference to the original flow, right?
    // Like if the user opens a flow overview it should take them
    // to the detail page for the entire flow...
}
