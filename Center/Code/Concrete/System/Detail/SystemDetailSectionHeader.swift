//
//  SystemDetailSectionHeader.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import UIKit

enum SystemDetailSectionHeader: Int, CaseIterable
{
    case info
    case suggestedFlows
    case stocks
    case flows
    case events
    case notes
}

func title(systemDetailSectionHeader: SystemDetailSectionHeader) -> String
{
    switch systemDetailSectionHeader
    {
    case .info:
        return "Info"
    case .suggestedFlows:
        return "Suggested Flows"
    case .stocks:
        return "Stocks"
    case .flows:
        return "Flows"
    case .events:
        return "Events"
    case .notes:
        return "Notes"
    }
}

func image(systemDetailSectionHeader: SystemDetailSectionHeader) -> UIImage?
{
    switch systemDetailSectionHeader
    {
    case .info, .suggestedFlows:
        return nil
    case .stocks:
        return UIImage(icon: .stock)
    case .flows:
        return UIImage(icon: .flow)
    case .events:
        return UIImage(icon: .event)
    case .notes:
        return UIImage(icon: .note)
    }
}
