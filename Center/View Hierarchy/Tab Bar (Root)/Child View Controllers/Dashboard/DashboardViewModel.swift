//
//  DashboardViewControllerModel.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Schema

protocol DashboardViewModelProtocol
{
    // MARK: Pins
    
    func getPinnedObjects() -> [Entity]
    func addPinnedObject(_ object: Entity)
    func removePinnedObject(_ object: Entity)
    
    // MARK: Flows
    
    func getUserActionableFlows() -> [Flow]
    
    // MARK: Events
    
    func getForcastedEvents() -> [Event]
    
    // MARK: Systems
    
    func getPrioritySystems() -> [System]
}

struct DashboardViewControllerModel
{
    
}
