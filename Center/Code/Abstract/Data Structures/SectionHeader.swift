//
//  SectionHeader.swift
//  Center
//
//  Created by Joshua Grant on 5/29/21.
//

import UIKit

/// Empty protocol to be conformed to by different types. Maybe we could convert
/// this to a struct or something? 
protocol SectionHeader { }

func title(sectionHeader: SectionHeader) -> String
{
    if let header = sectionHeader as? SystemDetailSectionHeader
    {
        switch header
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
    
    if let header = sectionHeader as? FlowDetailSectionHeader
    {
        switch header
        {
        case .info:
            return "Info"
        case .events:
            return "Events"
        case .notes:
            return "Notes"
        case .history:
            return "History"
        }
    }
    
    return ""
}

func image(sectionHeader: SectionHeader) -> UIImage?
{
    if let header = sectionHeader as? SystemDetailSectionHeader
    {
        switch header
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
    
    return nil
}

func hasDisclosureTriangle(sectionHeader: SectionHeader) -> Bool
{
    if let header = sectionHeader as? SystemDetailSectionHeader
    {
        switch header
        {
        case .info, .suggestedFlows:
            return false
        default:
            return true
        }
    }
    
    return false
}

func hasSearchButton(sectionHeader: SectionHeader) -> Bool
{
    return false
}

func hasLinkButton(sectionHeader: SectionHeader) -> Bool
{
    if let header = sectionHeader as? SystemDetailSectionHeader
    {
        switch header
        {
        case .info, .suggestedFlows:
            return false
        default:
            return true
        }
    }
    
    return false
}

func hasAddButton(sectionHeader: SectionHeader) -> Bool
{
    if let header = sectionHeader as? SystemDetailSectionHeader
    {
        switch header
        {
        case .info, .suggestedFlows:
            return false
        default:
            return true
        }
    }
    
    return false
}

func hasEditButton(sectionHeader: SectionHeader) -> Bool
{
    return false
}
