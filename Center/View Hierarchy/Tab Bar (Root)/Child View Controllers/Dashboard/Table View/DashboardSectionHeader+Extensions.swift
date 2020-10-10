//
//  DashboardSectionHeader.swift
//  Center
//
//  Created by Joshua Grant on 10/9/20.
//

import Foundation
import Core

extension DashboardSectionHeader
{
    var title: String
    {
        switch self
        {
        case .pinned:
            return "Pinned"
        case .flows:
            return "Flows"
        case .forecast:
            return "Forecast"
        case .priority:
            return "Priority"
        }
    }
    
    var icon: Icon
    {
        switch self
        {
        case .pinned:
            return .pinFill
        case .flows:
            return .flow
        case .forecast:
            return .forecast
        case .priority:
            return .priority
        }
    }
    
    func makeHeaderModel() -> TableViewHeaderModel
    {
        TableViewHeaderModel(
            title: title,
            icon: icon)
    }
}
