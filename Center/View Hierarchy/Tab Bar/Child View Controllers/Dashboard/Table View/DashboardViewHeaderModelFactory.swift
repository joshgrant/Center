//
//  DashboardViewTableSectionHeaderFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Architecture

public struct DashboardViewHeaderModelFactory
{
    func makeHeaderModels() -> [TableViewHeaderModel]
    {
        return [
            makePinnedHeaderModel(),
            makeFlowHeaderModel(),
            makeForecastHeaderModel(),
            makePrioritySystemHeaderModel()
        ]
    }
    
    func makePinnedHeaderModel() -> TableViewHeaderModel
    {
        return TableViewHeaderModel(
            title: "Pinned",
            icon: .pinFill)
    }
    
    func makeFlowHeaderModel() -> TableViewHeaderModel
    {
        return TableViewHeaderModel(
            title: "Flows",
            icon: .flow)
    }
    
    func makeForecastHeaderModel() -> TableViewHeaderModel
    {
        return TableViewHeaderModel(
            title: "Forecast",
            icon: .forecast)
    }
    
    func makePrioritySystemHeaderModel() -> TableViewHeaderModel
    {
        return TableViewHeaderModel(
            title: "Flows",
            icon: .priority)
    }
}
