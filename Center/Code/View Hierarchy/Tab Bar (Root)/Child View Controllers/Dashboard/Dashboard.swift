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

func makeDashboardTableViewDelegateModel(context: Context) -> TableViewDelegateModel
{
    let headerHeights: [CGFloat] = DashboardSectionHeader.allCases.count.map { 44 }
    
    return TableViewDelegateModel(
        headerViews: makeDashboardTableViewHeaderViews(context: context),
        sectionHeaderHeights: headerHeights,
        estimatedSectionHeaderHeights: headerHeights)
}

func makeDashboardTableViewDelegate(context: Context) -> TableViewDelegate
{
    let delegateModel = makeDashboardTableViewDelegateModel(context: context)
    return TableViewDelegate(model: delegateModel)
}

func makeDashboardTableViewDataSource(context: Context) -> TableViewDataSource
{
    let cellModels = makeDashboardCellModels(context: context)
    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
    return TableViewDataSource(model: dataSourceModel)
}

func makeDashboardTableViewModel(context: Context) -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeDashboardTableViewDelegate(context: context),
        dataSource: makeDashboardTableViewDataSource(context: context),
        cellModelTypes: makeDashboardTableViewCellModelTypes())
}


func makeDashboardRootViewController(context: Context) -> UIViewController
{
    // TODO: Datasource and delegate are weak references...
    // We need to keep them in memory...
    let tableViewModel = makeDashboardTableViewModel(context: context)
    let tableView = makeTableView(from: tableViewModel)
    
    let controller = ViewController()
    controller.view = tableView
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .dashboard)
    
    let delegate = DashboardSearchBarDelegate()
    let searchController = makeSearchController(searchBarDelegate: delegate)
    controller.navigationItem.searchController = searchController
    controller.navigationItem.hidesSearchBarWhenScrolling = true
    
    let navigationController = NavigationController(rootViewController: controller)
    
    return navigationController
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
