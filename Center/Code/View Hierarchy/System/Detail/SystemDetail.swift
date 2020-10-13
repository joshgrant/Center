//
//  SystemDetail.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import UIKit

enum SystemDetailSectionHeader: Int, CaseIterable
{
    case info
    case stocks
    case flows
    case events
    case notes
}

func makeSystemDetailViewController() -> ViewController
{
    let viewController = ViewController()
    
    let didSelect = makeSystemDetailDidSelectClosure(controller: viewController)
    let tableViewModel = makeSystemDetailTableViewModel(didSelect: didSelect)
    let tableView = makeTableView(from: tableViewModel)
    
    viewController.view = tableView
    
    return viewController
}

func makeSystemDetailTableViewModel(didSelect: @escaping TableViewSelectionClosure) -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeSystemDetailTableViewDelegate(didSelect: didSelect),
        dataSource: makeSystemDetailTableViewDataSource(),
        cellModelTypes: makeSystemDetailCellModelTypes())
}

func makeSystemDetailTableViewHeaderViews() -> [UIView]
{
    let headerModels = makeSystemDetailTableViewHeaderModels()
    return headerModels.map {
        makeTableViewSectionHeader(model: $0)
    }
}

func makeSystemDetailSectionHeaderHeights() -> [CGFloat]
{
    // TODO: Extract 44 to a global variable
    SystemDetailSectionHeader.allCases.count.map { 44 }
}

func makeSystemDetailTableViewDelegate(didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegate
{
    let delegateModel = TableViewDelegateModel(
        headerViews: makeSystemDetailTableViewHeaderViews(), // Info, stocks, flows, events, notes
        sectionHeaderHeights: makeSystemDetailSectionHeaderHeights(),
        estimatedSectionHeaderHeights: makeSystemDetailSectionHeaderHeights(),
        didSelect: didSelect)
    return TableViewDelegate(model: delegateModel)
}

func makeSystemDetailTableViewDataSource() -> TableViewDataSource
{
    let cellModels = makeSystemDetailTableViewDataSourceModels()
    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
    return TableViewDataSource(model: dataSourceModel)
}

func makeSystemDetailDidSelectClosure(controller: ViewController) -> TableViewSelectionClosure
{
    return { selection in
        print(selection)
    }
}

func makeSystemDetailCellModelTypes() -> [TableViewCellModel.Type]
{
    // Text edit title
    // Ideal
    // Suggested flow
    // Stock list
    // Flow list
    // Event list
    // Note list
    return []
}

// TODO: Make header views


func makeSystemDetailTableViewHeaderModels() -> [TableViewHeaderModel]
{
    SystemDetailSectionHeader.allCases.map {
        makeSystemDetailTableViewHeaderModel(sectionHeader: $0)
    }
}

func makeSystemDetailTableViewHeaderModel(sectionHeader: SystemDetailSectionHeader) -> TableViewHeaderModel
{
    TableViewHeaderModel(
        hasDisclosureTriangle: hasDisclosureTriangle(systemDetailSectionHeader: sectionHeader),
        image: image(systemDetailSectionHeader: sectionHeader),
        title: title(systemDetailSectionHeader: sectionHeader),
        hasSearchButton: hasSearchButton(systemDetailSectionHeader: sectionHeader),
        hasLinkButton: hasLinkButton(systemDetailSectionHeader: sectionHeader),
        hasAddButton: hasAddButton(systemDetailSectionHeader: sectionHeader),
        hasEditButton: hasEditButton(systemDetailSectionHeader: sectionHeader))
}

func hasDisclosureTriangle(systemDetailSectionHeader: SystemDetailSectionHeader) -> Bool
{
    switch systemDetailSectionHeader
    {
    case .info: return false
    default: return true
    }
}

func image(systemDetailSectionHeader: SystemDetailSectionHeader) -> UIImage?
{
    switch systemDetailSectionHeader
    {
    case .info:
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

func title(systemDetailSectionHeader: SystemDetailSectionHeader) -> String
{
    switch systemDetailSectionHeader
    {
    case .info:
        return "Info"
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

func hasSearchButton(systemDetailSectionHeader: SystemDetailSectionHeader) -> Bool
{
    return false
}

func hasLinkButton(systemDetailSectionHeader: SystemDetailSectionHeader) -> Bool
{
    switch systemDetailSectionHeader
    {
    case .info: return false
    default: return true
    }
}

func hasAddButton(systemDetailSectionHeader: SystemDetailSectionHeader) -> Bool
{
    switch systemDetailSectionHeader
    {
    case .info: return false
    default: return true
    }
}

func hasEditButton(systemDetailSectionHeader: SystemDetailSectionHeader) -> Bool
{
    return false
}

func makeSystemDetailTableViewDataSourceModels() -> [[TableViewCellModel]]
{
    // Section 1
    // Text cell
    // ideal cell
    // Suggested flows
    
    // Stocks
    // Flows
    // Events
    // Notes
    
    return [
        [],
        [],
        [],
        [],
        []
    ]
}
