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
    let didSelect = makeDashboardRootViewDidSelectAction(context: context)
    let tableViewModel = makeDashboardTableViewModel(context: context, didSelect: didSelect)
    let tableView = makeTableView(from: tableViewModel)
    
    controller.view = tableView
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .dashboard)
    
    let delegate = SearchBarDelegate()
    let searchController = makeSearchController(searchBarDelegate: delegate)
    controller.navigationItem.searchController = searchController
    controller.navigationItem.hidesSearchBarWhenScrolling = true
    controller.navigationItem.title = "45% Balanced"
    
    let navigationController = NavigationController(rootViewController: controller)
    
    return navigationController
}

func makeDashboardRootViewDidSelectAction(context: Context) -> TableViewSelectionClosure
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
            handleTappedDashboardPinnedItem(
                context: context,
                row: row)
        case .flows:
            handleTappedDashboardFlow(at: row)
        case .forecast:
            handleTappedDashboardForecastFlow(at: row)
        case .priority:
            handleTappedDashboardPriority(at: row)
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
    let pins = getPinnedObjects(context: context)
    let cells = PinnedListCellModel.pinnedCellModels(from: pins)
    return cells
}

func getPinnedObjects(context: Context) -> [Entity]
{
    let request = Entity.makePinnedObjectsFetchRequest()
    do {
        let results = try context.fetch(request)
        return results
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}

// MARK: - ACTION HANDLING

// The problem with these is that they implicitly modify state...
// I don't want side effects, i.e I need to pass the system state to these
// How can I represent state? Well, I can create an object that holds all of the state
// and return it from each function. Therefore, it must be a struct.
// How can we contain all state? Nested structs? maybe a singleton class? 

func handleTappedDashboardPinnedItem(context: Context, row: Int)
{
    // Find the appropriate object
    // Find the relevant view controller
    // Push the view controller on the stack
    
//    let pins = getPinnedObjects(context: context)
//    let selectedPin = pins[row]
//    let controller = viewController(for: selectedPin)
    
    // I feel like these are "side effects" that modify the state indirectly, instead of returning a new state
    // How can we return a new state and have it properly push the new controller onto the stack?
//    appState
//        .controller?
//        .navigationController?
//        .pushViewController(controller, animated: true)
//
//    AppState.transition(to: selectedPin)
    
//    appState.controller = controller
    ///
//    return appState
    
    // TODO: Shoud notify about changes for the app state
}

func viewController(for pin: Entity, context: Context) -> ViewController?
{
    guard let entityType = entityType(for: pin) else {
        assertionFailure("The pinned entity didn't have a valid entity type")
        return nil
    }
    
    guard let type = viewControllerType(for: entityType, detail: true) else {
        assertionFailure("The entity type doesn't correspond with a view controller type")
        return nil
    }
    
    switch pin
    {
    case let pin as System:
        return makeDetailController(
            type: type,
            entity: pin,
            context: context)
    default:
        return ViewController()
    }
}

func handleTappedDashboardFlow(at row: Int)
{
    // Find the selected flow
    // Open up the flow detail page for that flow
    // Takes in an app state, and returns a new app state
}

func handleTappedDashboardForecastFlow(at row: Int)
{
    // Find the relevant event
    // Open up the event detail page
}

func handleTappedDashboardPriority(at row: Int)
{
    // Find the relevant system
    // Open up the system detail page
}
