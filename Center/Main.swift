//
//  Main.swift
//  Center
//
//  Created by Joshua Grant on 10/9/20.
//

import UIKit

func makeTabBarControllers(context: Context) -> [UIViewController]
{
    TabBarItem.allCases.map {
        makeViewController(tabBarItem: $0, context: context)
    }
}

func makeViewController(tabBarItem: TabBarItem, context: Context) -> UIViewController
{
    switch tabBarItem
    {
    case .dashboard:
        return makeDashboardRootViewController(context: context)
    case .library:
        return makeLibraryRootViewController()
    case .inbox:
        return makeInboxRootViewController()
    case .settings:
        return makeSettingsRootViewController()
    }
}

// Dashboard

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

func makeTableViewSectionHeader(model: TableViewHeaderModel) -> View
{
    let view = View(frame: CGRect(origin: .zero, size: .init(width: 30, height: 30)))
    view.backgroundColor = .systemGroupedBackground
    
    let stackViewFactory = TableViewSectionHeaderViewFactory(sectionHeaderModel: model)
    
    let stackView = stackViewFactory.makeMainStackView()
    view.embed(stackView)
    
    return view
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
    TableViewDelegate(model: makeDashboardTableViewDelegateModel(context: context))
}

func makeDashboardTableViewDataSourceModel(context: Context) -> TableViewDataSourceModel
{
    TableViewDataSourceModel(cellModels: makeDashboardCellModels(context: context))
}

func makeDashboardTableViewDataSource(context: Context) -> TableViewDataSource
{
    TableViewDataSource(model: makeDashboardTableViewDataSourceModel(context: context))
}

func makeDashboardTableViewModel(context: Context) -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeDashboardTableViewDelegate(context: context),
        dataSource: makeDashboardTableViewDataSource(),
        cellModelTypes: makeDashboardTableViewCellModelTypes())
}


func makeDashboardRootViewController(context: Context) -> UIViewController
{
    let tableViewModel = makeDashboardTableViewModel(context: context)
    let tableView = makeTableView(from: tableViewModel)
    let delegate = DashboardSearchBarDelegate()
    
    let cellModels = try! makeDashboardCellModels(context: context)
    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
    let dataSource = TableViewDataSource(model: dataSourceModel)
    tableView.dataSource = dataSource
    
    let controller = ViewController()
    controller.view = tableView
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .dashboard)
    
    let searchController = makeDashboardSearchController(searchBarDelegate: delegate)
    controller.navigationItem.searchController = searchController
    controller.navigationItem.hidesSearchBarWhenScrolling = true
    
    return controller
}

func makeDashboardCellModels(context: Context) throws -> [[TableViewCellModel]]
{
    [
        try makePinnedModels(context: context),
        [],
        try makeForecastModels(context: context),
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

func makeForecastModels(context: Context) throws -> [TableViewCellModel]
{
    let fetchRequest = makeDateSourcesFetchRequest()
    let sources = try context.fetch(fetchRequest)
    let events = Event.eventsFromSources(sources)
    let cells = EventListCellModel.eventCellModelsFrom(events: events)
    return cells
}

func makePinnedModels(context: Context) throws -> [TableViewCellModel]
{
    let fetchRequest = Entity.makePinnedObjectsFetchRequest()
    let objects = try context.fetch(fetchRequest)
    let cells = PinnedListCellModel.pinnedCellModels(from: objects)
    return cells
}

func makeDashboardSearchController(searchBarDelegate: UISearchBarDelegate) -> UISearchController
{
    let searchResultsController = SearchViewController()
    let searchController = UISearchController(searchResultsController: searchResultsController)
    searchController.searchBar.delegate = searchBarDelegate
    return searchController
}

// Library

func makeLibraryRootViewController() -> UIViewController
{
    let controller = ViewController()
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .library)
    return controller
}

func makeInboxRootViewController() -> UIViewController
{
    let controller = ViewController()
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .inbox)
    return controller
}

func makeSettingsRootViewController() -> UIViewController
{
    let controller = ViewController()
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .settings)
    return controller
}
