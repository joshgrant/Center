//
//  Dashboard.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import UIKit

func makeDashboardTableViewCellModelTypes() -> [TableViewCellModel.Type]
{
    [PinnedListCellModel.self, EventListCellModel.self]
}

func makeDashboardTableViewHeaderModels(context: Context) -> [TableViewHeaderModel]
{
    DashboardSectionHeader.allCases.map {
        makeTableViewHeaderModel(dashboardSectionHeader: $0)
    }
}

func makeDashboardTableViewHeaderViews(context: Context) -> [UIView?]
{
    let models = makeDashboardTableViewHeaderModels(context: context)
    return models.map {
        makeTableViewSectionHeader(model: $0)
    }
}

func makeDashboardTableViewDelegateModel(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegateModel
{
    let headerHeights: [CGFloat] = DashboardSectionHeader.allCases.count.map { 44 }
    
    return TableViewDelegateModel(
        headerViews: makeDashboardTableViewHeaderViews(context: context),
        sectionHeaderHeights: headerHeights,
        estimatedSectionHeaderHeights: headerHeights,
        didSelect: didSelect)
}

func makeDashboardTableViewDelegate(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegate
{
    let delegateModel = makeDashboardTableViewDelegateModel(context: context, didSelect: didSelect)
    return TableViewDelegate(model: delegateModel)
}

func makeDashboardTableViewDataSource(context: Context) -> TableViewDataSource
{
    let cellModels = makeDashboardCellModels(context: context)
    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
    return TableViewDataSource(model: dataSourceModel)
}

func makeDashboardTableViewModel(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeDashboardTableViewDelegate(context: context, didSelect: didSelect),
        dataSource: makeDashboardTableViewDataSource(context: context),
        cellModelTypes: makeDashboardTableViewCellModelTypes())
}


func makeDashboardRootViewController(context: Context) -> UIViewController
{
    let controller = ViewController()
    // TODO: Datasource and delegate are weak references...
    // We need to keep them in memory...
    let didSelect = makeDashboardRootViewDidSelectAction()
    let tableViewModel = makeDashboardTableViewModel(context: context, didSelect: didSelect)
    let tableView = makeTableView(from: tableViewModel)
    
    controller.view = tableView
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .dashboard)
    
    let delegate = DashboardSearchBarDelegate()
    let searchController = makeSearchController(searchBarDelegate: delegate)
    controller.navigationItem.searchController = searchController
    controller.navigationItem.hidesSearchBarWhenScrolling = true
    controller.navigationItem.title = "45% Balanced"
    
    let navigationController = NavigationController(rootViewController: controller)
    
    return navigationController
}

func makeDashboardRootViewDidSelectAction() -> TableViewSelectionClosure
{
    return { selection in
        guard let section = DashboardSectionHeader(rawValue: selection.indexPath.row) else {
            assertionFailure("Selected a row that doesn't exist: \(selection)")
            return
        }
        
        let row = selection.indexPath.row
        
        switch section
        {
        case .pinned:
            handleTappedDashboardPinnedItem(row: row)
        case .flows:
            handleTappedDashboardFlow(row: row)
        case .forecast:
            handleTappedDashboardForecastFlow(row: row)
        case .priority:
            handleTappedDashboardPriority(row: row)
        }
    }
}

func makeDashboardCellModels(context: Context) -> [[TableViewCellModel]]
{
    [
        makePinnedModels(context: context),
        [],
        makeForecastModels(context: context),
        []
    ]
}

func title(dashboardSectionHeader: DashboardSectionHeader) -> String
{
    switch dashboardSectionHeader
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

func icon(dashboardSectionHeader: DashboardSectionHeader) -> Icon
{
    switch dashboardSectionHeader
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

func makeTableViewHeaderModel(dashboardSectionHeader: DashboardSectionHeader) -> TableViewHeaderModel
{
    let _title = title(dashboardSectionHeader: dashboardSectionHeader)
    let _icon = icon(dashboardSectionHeader: dashboardSectionHeader)
    return TableViewHeaderModel(
        title: _title,
        icon: _icon)
}

func makeForecastModels(context: Context) -> [TableViewCellModel]
{
    let fetchRequest = makeDateSourcesFetchRequest()
    do {
        let sources = try context.fetch(fetchRequest)
        let events = Event.eventsFromSources(sources)
        let cells = EventListCellModel.eventCellModelsFrom(events: events)
        return cells
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}

func makePinnedModels(context: Context) -> [TableViewCellModel]
{
    let fetchRequest = Entity.makePinnedObjectsFetchRequest()
    do {
        let objects = try context.fetch(fetchRequest)
        let cells = PinnedListCellModel.pinnedCellModels(from: objects)
        return cells
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}

func makeSearchController(searchBarDelegate: UISearchBarDelegate) -> UISearchController
{
    let searchResultsController = SearchViewController()
    let searchController = UISearchController(searchResultsController: searchResultsController)
    searchController.searchBar.delegate = searchBarDelegate
    return searchController
}

// MARK: - ACTION HANDLING

// The problem with these is that they implicitly modify state...
// I don't want side effects, i.e I need to pass the system state to these
// How can I represent state? Well, I can create an object that holds all of the state
// and return it from each function. Therefore, it must be a struct.
// How can we contain all state? Nested structs? maybe a singleton class? 

func handleTappedDashboardPinnedItem(row: Int)
{
    // Find the appropriate object
    // Find the relevant view controller
    // Push the view controller on the stack
}

func handleTappedDashboardFlow(row: Int)
{
    // Find the selected flow
    // Open up the flow detail page for that flow
}

func handleTappedDashboardForecastFlow(row: Int)
{
    // Find the relevant event
    // Open up the event detail page
}

func handleTappedDashboardPriority(row: Int)
{
    // Find the relevant system
    // Open up the system detail page
}
