//
//  DashboardViewControllerModel.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

protocol DashboardViewModelProtocol
{
    // MARK: Pins
    
    func getPinnedObjects() -> [ObjectProtocol]
    func addPinnedObject(_ object: ObjectProtocol)
    func removePinnedObject(_ object: ObjectProtocol)
    
    // MARK: Flows
    
    func getUserActionableFlows() -> [FlowProtocol]
    
    // MARK: Events
    
    func getForcastedEvents() -> [EventProtocol]
    
    // MARK: Systems
    
    func getPrioritySystems() -> [SystemProtocol]
}

struct TableViewSection
{
    var hasDisclosureTriangle: Bool
    var icon: UIImage
    var title: String
    var hasSearchButton: Bool
    var hasLinkButton: Bool
    var hasAddButton: Bool
    var hasEditButton: Bool
}

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
        
        // Each section can have the following:
        // Disclosure triangle
        // Icon
        // Title
        // Search button / link button
        // Add button
        // Edit button
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

struct DashboardViewTableSectionFactory
{
    static func makeTableSections() -> [TableViewSection]
    {
        return [
            makePinnedSection(),
            makeFlowSection(),
            makeForecastSection(),
            makePrioritySystemSection()
        ]
    }
    
    static func makePinnedSection() -> TableViewSection
    {
        return TableViewSection(
            hasDisclosureTriangle: false,
            icon: UIImage(), title: <#T##String#>, hasSearchButton: <#T##Bool#>, hasLinkButton: <#T##Bool#>, hasAddButton: <#T##Bool#>, hasEditButton: <#T##Bool#>)
    }
    
    static func makeFlowSection() -> TableViewSection
    {
        
    }
    
    static func makeForecastSection() -> TableViewSection
    {
        
    }
    
    static func makePrioritySystemSection() -> TableViewSection
    {
        
    }
}
