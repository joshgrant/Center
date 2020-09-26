//
//  SystemProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

/**
 
 Each of these protocols should be made concrete by a given type - doesn't matter what or from where.
 
 Unlinking a flow or an event doesn't make sense because the stocks determine which events and flows
 show in the system
 */

// The object protocol will absorb some of this functionality
protocol SystemProtocol: ObjectProtocol
{
    func getIdeal() -> Int
    
    func getSuggestedFlows() -> [FlowProtocol]
    
    func getStocks() -> [StockProtocol]
    func linkStock(_ stock: StockProtocol)
    
    func getFlows() -> [FlowProtocol]
    func linkFlow(_ flow: FlowProtocol)
    
    func getEvents() -> [EventProtocol]
    func linkEvent(_ event: EventProtocol)
}
