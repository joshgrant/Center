//
//  DashboardStateMachine.swift
//  Center
//
//  Created by Joshua Grant on 10/20/20.
//

import Foundation

enum DashboardState: String, Codable
{
    case normal
    case searching
    case refreshing
    case scrolling
    case transitioningToDetail
}

class DashboardStateMachine: StateMachine<DashboardState>
{
    
}
