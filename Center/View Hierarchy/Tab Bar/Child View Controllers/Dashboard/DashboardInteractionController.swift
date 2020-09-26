//
//  DashboardInteractionController.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

// Each of these should activate a useCase

protocol DashboardInteractionControllerProtocol
{
    func refreshDashboard()
    
    func search(_ value: String)
    
    func selectPinnedObject(_ object: ObjectProtocol)
    
    func selectSuggestedFlow(_ flow: FlowProtocol)
    func completeSuggestedFlow(_ flow: FlowProtocol)
    
    func selectForecastEvent(_ event: EventProtocol)
    
    func selectPrioritySystem(_ system: SystemProtocol)
}
