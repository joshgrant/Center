//
//  SectionHeader.swift
//  Center
//
//  Created by Joshua Grant on 5/29/21.
//

import UIKit

enum SectionHeader: Int
{
    case info
    case suggestedFlows
    case stocks
    case flows
    case events
    case notes
    case history
    case pinned
    case forecast
    case priority
    
    static var systemDetail: [SectionHeader] {
        [
            .info, .stocks, .flows, .events, .notes
        ]
    }
    
    static var flowDetail: [SectionHeader] {
        [
            .info, .events, .history, .notes
        ]
    }
    
    static var dashboard: [SectionHeader] {
        [
            .pinned, .flows, .forecast, .priority
        ]
    }
    
    var title: String
    {
        switch self
        {
        case .info: return "Info"
        case .suggestedFlows: return "Suggested Flows"
        case .stocks: return "Stocks"
        case .flows: return "Flows"
        case .events: return "Events"
        case .notes: return "Notes"
        case .history: return "History"
        case .pinned: return "Pinned"
        case .forecast: return "Forecast"
        case .priority: return "Priority"
        }
    }
    
    var icon: Icon?
    {
        switch self
        {
        case .info, .suggestedFlows: return nil
        case .stocks: return .stock
        case .flows: return .flow
        case .events: return .event
        case .notes: return .note
        case .pinned: return .pinFill
        case .forecast: return .forecast
        case .priority: return .priority
        case .history: return nil
        }
    }
    
    var hasDisclosureTriangle: Bool
    {
        switch self
        {
        case .info, .suggestedFlows:
            return false
        default:
            return true
        }
    }
    
    var hasSearchButton: Bool
    {
        return false
    }
    
    var hasLinkButton: Bool
    {
        switch self
        {
        case .info, .suggestedFlows:
            return false
        default:
            return true
        }
    }
    
    var hasAddButton: Bool
    {
        switch self
        {
        case .info, .suggestedFlows:
            return false
        default:
            return true
        }
    }
    
    var hasEditButton: Bool
    {
        return false
    }
}
