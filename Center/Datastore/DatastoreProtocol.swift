//
//  DatastoreProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import Foundation

protocol DatastoreProtocol
{
    // MARK: - Dashboard

    // MARK: Pins
    
    func getPinnedObjects() -> [ObjectProtocol]
    func addPinnedObject(_ object: ObjectProtocol)
    func removePinnedObject(_ object: ObjectProtocol)
    
    // MARK: Flows
    
    func getUserActionableFlows() -> [FlowProtocol]
    
    // MARK: Events
    
    func getForcastedEvents() -> [EventProtocol]
    
    // MARK: Systems
    
    func getPrioritySystems() -> [SystemProtocol]
    
    // MARK: - Library
    
    func getSystemsCount() -> Int
    func getStocksCount() -> Int
    func getFlowsCount() -> Int
    func getEventsCount() -> Int
    func getConversionsCount() -> Int
    func getDimensionsCount() -> Int
    func getSymbolsCount() -> Int
    func getNotesCount() -> Int
    func getProcessesCount() -> Int
    
    // MARK: - Listing pages
    
    func getSystemOverviews() -> [SystemOverviewProtocol]
    func getStockOverviews() -> [StockOverviewProtocol]
    func getFlowOverviews() -> [FlowOverviewProtocol]
    func getEventOverviews() -> [EventOverviewProtocol]
}
