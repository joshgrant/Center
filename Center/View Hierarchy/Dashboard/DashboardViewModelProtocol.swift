//
//  DashboardViewModelProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol DashboardViewModelProtocol
{
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
}