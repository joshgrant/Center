//
//  Dashboard.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import UIKit
//
//func makeDashboardTableViewCellModelTypes() -> [TableViewCellModel.Type]
//{
//    [PinnedListCellModel.self, EventListCellModel.self]
//}

//func makeDashboardTableViewHeaderModels(context: Context) -> [TableViewHeaderModel]
//{
//    DashboardSectionHeader.allCases.map {
//        makeTableViewHeaderModel(dashboardSectionHeader: $0)
//    }
//}

//func makeDashboardTableViewHeaderViews(context: Context) -> [UIView?]
//{
//    let models = makeDashboardTableViewHeaderModels(context: context)
//    return models.map {
//        makeTableViewSectionHeader(model: $0)
//    }
//}

//func makeDashboardTableViewDelegateModel(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegateModel
//{
//    let headerHeights: [CGFloat] = DashboardSectionHeader.allCases.count.map { 44 }
//
//    return TableViewDelegateModel(
//        headerViews: makeDashboardTableViewHeaderViews(context: context),
//        sectionHeaderHeights: headerHeights,
//        estimatedSectionHeaderHeights: headerHeights,
//        didSelect: didSelect)
//}

//func makeDashboardTableViewDelegate(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegate
//{
//    let delegateModel = makeDashboardTableViewDelegateModel(context: context, didSelect: didSelect)
//    return TableViewDelegate(model: delegateModel)
//}

//func makeDashboardTableViewDataSource(context: Context) -> TableViewDataSource
//{
//    let cellModels = makeDashboardCellModels(context: context)
//    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
//    return TableViewDataSource(model: dataSourceModel)
//}

//func makeDashboardTableViewModel(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewModel
//{
//    TableViewModel(
//        style: .grouped,
//        delegate: makeDashboardTableViewDelegate(context: context, didSelect: didSelect),
//        dataSource: makeDashboardTableViewDataSource(context: context),
//        cellModelTypes: makeDashboardTableViewCellModelTypes())
//}


//func makeDashboardRootViewController(context: Context) -> UIViewController
//{
//    let controller = ViewController()
//    // TODO: Datasource and delegate are weak references...
//    // We need to keep them in memory...
//    let didSelect = makeDashboardRootViewDidSelectAction(
//        controller: controller,
//        context: context)
//    let tableViewModel = makeDashboardTableViewModel(
//        context: context,
//        didSelect: didSelect)
//    let tableView = makeTableView(from: tableViewModel)
//
//    controller.view = tableView
//    controller.tabBarItem = makeUITabBarItem(tabBarItem: .dashboard)
//
//    let delegate = SearchBarDelegate()
//    let searchController = makeSearchController(searchBarDelegate: delegate)
//    controller.navigationItem.searchController = searchController
//    controller.navigationItem.hidesSearchBarWhenScrolling = true
//    controller.navigationItem.title = "45% Balanced"
//
//    let navigationController = NavigationController(rootViewController: controller)
//
//    return navigationController
//}

func makeDashboardRootViewDidSelectAction(controller: ViewController, context: Context) -> TableViewSelectionClosure
{
    return { selection in
        let section = SectionHeader.dashboard[selection.indexPath.section]
        
        let row = selection.indexPath.row
        
        var entity: Entity?
        
        switch section
        {
        case .pinned:
            let pins = getPinnedObjects(context: context)
            entity = pins[row]
        case .flows:
            return
        case .forecast:
            let forecasts = getForecastedEvents(context: context)
            entity = forecasts[row]
        case .priority:
            return
        default:
            return
        }
        
        guard let entity = entity else { return }
        
        guard let _controller = viewController(
                for: entity,
                context: context) else { return }
        
        controller
            .navigationController?
            .pushViewController(_controller, animated: true)
    }
}


//func makeTableViewHeaderModel(dashboardSectionHeader: DashboardSectionHeader) -> TableViewHeaderModel
//{
//    let _title = title(dashboardSectionHeader: dashboardSectionHeader)
//    let _icon = icon(dashboardSectionHeader: dashboardSectionHeader)
//    return TableViewHeaderModel(
//        title: _title,
//        icon: _icon)
//}

func getForecastedEvents(context: Context) -> [Event]
{
    let fetchRequest = makeDateSourcesFetchRequest()
    do {
        let sources = try context.fetch(fetchRequest)
        let events = Event.eventsFromSources(sources)
        return events
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}

func makeForecastModels(context: Context) -> [TableViewCellModel]
{
    let events = getForecastedEvents(context: context)
    return EventListCellModel.eventCellModelsFrom(events: events)
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

//func handleTappedDashboardPinnedItem(controller: ViewController, context: Context, row: Int)
//{
//    // Find the appropriate object
//    // Find the relevant view controller
//    // Push the view controller on the stack
//
//    let pins = getPinnedObjects(context: context)
//    let selectedPin = pins[row]
//    print(selectedPin)
//    guard let _controller = viewController(for: selectedPin, context: context)
//    else { return }
//
//    controller
//        .navigationController?
//        .pushViewController(_controller, animated: true)
//    // I feel like these are "side effects" that modify the state indirectly, instead of returning a new state
//    // How can we return a new state and have it properly push the new controller onto the stack?
////    appState
////        .controller?
////        .navigationController?
////        .pushViewController(controller, animated: true)
////
////    AppState.transition(to: selectedPin)
//
////    appState.controller = controller
//    ///
////    return appState
//
//    // TODO: Shoud notify about changes for the app state
//}

func viewController(for pin: Entity, context: Context) -> ViewController?
{
    guard let entityType = entityType(for: pin) else {
        assertionFailure("The pinned entity didn't have a valid entity type")
        return nil
    }
    
    let page = Page(
        kind: entityType,
        modifier: .detail(entity: pin))
    
    return makeDetailController(
        page: page,
        context: context)
}

//func handleTappedDashboardFlow(at row: Int)
//{
//    // Find the selected flow
//    // Open up the flow detail page for that flow
//    // Takes in an app state, and returns a new app state
//}
//
//func handleTappedDashboardForecastFlow(at row: Int)
//{
//    // Find the relevant event
//    // Open up the event detail page
//}
//
//func handleTappedDashboardPriority(at row: Int)
//{
//    // Find the relevant system
//    // Open up the system detail page
//}
