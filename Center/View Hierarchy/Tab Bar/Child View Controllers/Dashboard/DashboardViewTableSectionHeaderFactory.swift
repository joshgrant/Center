//
//  DashboardViewTableSectionHeaderFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Architecture

public struct DashboardViewTableSectionHeaderFactory
{
    static func makeTableViewSectionHeaderModels() -> [TableViewSectionHeaderModel]
    {
        return [
            makePinnedSectionHeaderModel(),
            makeFlowSectionHeaderModel(),
            makeForecastSectionHeaderModel(),
            makePrioritySystemSectionHeaderModel()
        ]
    }
    
    static func makePinnedSectionHeaderModel() -> TableViewSectionHeaderModel
    {
        return TableViewSectionHeaderModel(
            title: "Pinned",
            icon: .pinFill)
    }
    
    static func makeFlowSectionHeaderModel() -> TableViewSectionHeaderModel
    {
        return TableViewSectionHeaderModel(
            title: "Flows",
            icon: .flow)
    }
    
    static func makeForecastSectionHeaderModel() -> TableViewSectionHeaderModel
    {
        return TableViewSectionHeaderModel(
            title: "Forecast",
            icon: .forecast)
    }
    
    static func makePrioritySystemSectionHeaderModel() -> TableViewSectionHeaderModel
    {
        return TableViewSectionHeaderModel(
            title: "Flows",
            icon: .priority)
    }
}
