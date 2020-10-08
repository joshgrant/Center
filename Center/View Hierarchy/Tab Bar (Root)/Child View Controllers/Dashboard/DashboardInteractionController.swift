//
//  DashboardInteractionController.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import Schema
// Each of these should activate a useCase

protocol DashboardInteractionControllerProtocol
{
    func refreshDashboard()
    
    func search(_ value: String)
    
    func selectPinnedEntity(_ entity: Entity)
    
    func selectSuggestedFlow(_ flow: Flow)
    func completeSuggestedFlow(_ flow: Flow)
    
    func selectForecastEvent(_ event: Event)
    
    func selectPrioritySystem(_ system: System)
}
