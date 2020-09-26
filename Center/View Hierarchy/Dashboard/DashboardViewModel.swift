//
//  DashboardViewControllerModel.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import Foundation

/// A view model is responsible for representing the possible states of a controller
struct DashboardViewControllerModel
{
    // Pinned
    // Flows
    // Forecast
    // Systems
    
    enum Section: Int, CaseIterable {
        case pinned
        case flows
        case forecast
        case systems
    }
    
    enum PinnedRow: Int, CaseIterable {
        
    }
    
    enum FlowRow: Int, CaseIterable {
        
    }
    
    enum ForecastRow: Int, CaseIterable {
        
    }
    
    enum SystemRow: Int, CaseIterable {
        
    }
}

// How do we represent a table view as a model?
// 
