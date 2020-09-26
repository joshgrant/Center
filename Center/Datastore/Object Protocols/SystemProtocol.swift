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
    
    func getSuggestedFlowOverviews() -> [FlowOverviewProtocol]
    
    func getStockOverviews() -> [StockOverviewProtocol]
    func linkStock(_ stock: Stock)
    
    func getFlowOverviews() -> [FlowOverviewProtocol]
    func linkFlow(_ flow: Flow)
    
    func getEventOverviews() -> [EventOverviewProtocol]
    func linkEvent(_ event: Event)
}

protocol SystemOverviewProtocol: ObjectProtocol
{
    func getName() -> String
    func getIdeal() -> Int
}
