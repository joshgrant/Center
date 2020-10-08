//
//  DashboardViewTableSectionHeaderFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import Core

public struct DashboardViewHeaderModelFactory
{
    public let headerModels = Self.makeHeaderModels()
    
    private static func makeHeaderModels() -> [TableViewHeaderModel]
    {
        return [
            makePinnedHeaderModel(),
            makeFlowHeaderModel(),
            makeForecastHeaderModel(),
            makePrioritySystemHeaderModel()
        ]
    }
    
    private static func makePinnedHeaderModel() -> TableViewHeaderModel
    {
        return TableViewHeaderModel(
            title: "Pinned",
            icon: .pinFill)
    }
    
    private static func makeFlowHeaderModel() -> TableViewHeaderModel
    {
        return TableViewHeaderModel(
            title: "Flows",
            icon: .flow)
    }
    
    private static func makeForecastHeaderModel() -> TableViewHeaderModel
    {
        return TableViewHeaderModel(
            title: "Forecast",
            icon: .forecast)
    }
    
    private static func makePrioritySystemHeaderModel() -> TableViewHeaderModel
    {
        return TableViewHeaderModel(
            title: "Priority",
            icon: .priority)
    }
}
