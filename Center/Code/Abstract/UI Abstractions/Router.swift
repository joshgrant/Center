//
//  Router.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import Foundation
import UIKit
import CoreData

func entityType(for entity: Entity) -> EntityType?
{
    switch entity
    {
    case is System: return .system
    case is Stock: return .stock
    case is TransferFlow: return .flow
    case is ProcessFlow: return .process
    case is Event: return .event
    case is Conversion: return .conversion
    case is Condition: return .condition
    case is Dimension: return .dimension
    case is Unit: return .unit
    case is Symbol: return .symbol
    case is Note: return .note
    default:
        return nil
    }
}

func entityType(for page: Page) -> EntityType?
{
    if let entityType = page.kind as? EntityType {
        return entityType
    } else {
        return nil
    }
}

//func detailControllerPage(for type: ViewControllerType, entity: NSManagedObject) -> Page?
//{
//    switch type {
//    case .systemList: return .systemDetail(system: entity as? System)
//    case .stockList: return .stockDetail
//    case .flowList: return .flowDetail(flow: entity as? TransferFlow)
//    case .eventList: return .eventDetail
//    case .noteList: return .noteDetail
//    case .processList: return .processDetail
//    case .conversionList: return .conversionDetail
//    case .conditionList: return .conditionDetail
//    case .unitList: return .unitDetail
//    case .symbolList: return .symbolDetail
//    case .dashboard, .library, .inbox, .settings, .systemDetail, .stockDetail, .amountDetail, .flowDetail, .eventDetail, .conditionDetail, .noteDetail, .noteInfo, .processDetail, .conversionDetail, .dimensionList, .unitDetail, .search, .searchFilter, .symbolDetail, .nonType:
//        return .nonType
//    // TODO: Dimension list?
//    }
//}

//func title(for type: ViewControllerType) -> String
//{
//    // TODO: Pluralize if necessary
//    return String(describing: type)
//        .split { $0.isUppercase }
//        .first?
//        .localizedCapitalized
//        ?? String(describing: type)
//}

public func makeTableView(from tableViewModel: TableViewModel) -> TableView
{
    let tableView = TableView(frame: .zero, style: tableViewModel.style)
    
    tableViewModel.cellModelTypes.forEach {
        tableView.register($0.cellClass, forCellReuseIdentifier: $0.cellReuseIdentifier)
    }
    
    tableView.delegate = tableViewModel.delegate
    tableView.dataSource = tableViewModel.dataSource
    
    // This is to keep the delegate and dataSource in memory, because they are weak references.
    tableView.model = tableViewModel
    
    return tableView
}

// MARK: - Search Controller

public func makeSearchController(searchBarDelegate: UISearchBarDelegate) -> UISearchController
{
    let searchResultsController = SearchViewController()
    let searchController = UISearchController(searchResultsController: searchResultsController)
    searchController.searchBar.delegate = searchBarDelegate
    return searchController
}

// MARK: - Detail Controller

func makeDetailController(page: Page, context: Context) -> ViewController
{
    let viewController = ViewController()
    
    let didSelect = makeDidSelect(page: page, controller: viewController, context: context)
    let tableViewModel = makeTableViewModel(page: page, context: context, didSelect: didSelect)
    let tableView = makeTableView(from: tableViewModel)
    
    // TODO: Maybe use the title of the entity?
    viewController.title = page.kind.title
    viewController.view = tableView
    
    return viewController
}

// Tab Controller

func makeTabController(type: TabType, context: Context) -> NavigationController
{
    let page = Page(kind: type)
    
    let controller = makeListController(
        page: page,
        context: context)
    
    controller.tabBarItem = type.tabBarItem
    
    let navigationController = NavigationController(rootViewController: controller)
    
    return navigationController
}

// MARK: - List Controller

func makeListController(
    page: Page,
    context: Context)
-> ViewController
{
    let controller = ViewController()
    
    // TODO: Optional depending on ViewControllerType
    let didSelect = makeDidSelect(
        page: page,
        controller: controller,
        context: context)
    
    // TODO: Not necessarily a table view model
    let model = makeTableViewModel(
        page: page,
        context: context,
        didSelect: didSelect)
    
    let tableView = makeTableView(from: model)
    
    controller.view = tableView
    
    // TODO: Only if the the ViewControllerType has a search bar
    let searchController = makeSearchController()
    controller.navigationItem.searchController = searchController
    controller.navigationItem.hidesSearchBarWhenScrolling = true
    
    // TODO: Not every list controller needs an add button? OR is this just for the library?
    let actionClosure = makeAddActionClosure(
        page: page,
        controller: controller,
        context: context)
    
    controller.actionClosures.insert(actionClosure)
    controller.navigationItem.rightBarButtonItem = makeListAddButton(actionClosure: actionClosure)
    
    controller.title = page.kind.title
    
    return controller
}

func shouldUseAddButton(page: Page) -> Bool
{
    //    switch type
    //    {
    //    case .dashboard, .library, .settings,
    //    }
    return true
}

// MARK: - Table View Model

func makeTableViewModel(
    page: Page,
    context: Context,
    didSelect: @escaping TableViewSelectionClosure)
-> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeTableViewDelegate(
            page: page,
            didSelect: didSelect),
        dataSource: makeTableViewDataSource(
            page: page,
            context: context),
        cellModelTypes: makeCellModelTypes(page: page))
}

// MARK: - Table View Delegate

func makeTableViewDelegate(
    page: Page,
    didSelect: @escaping TableViewSelectionClosure)
-> TableViewDelegate
{
    let delegateModel = TableViewDelegateModel(
        headerViews: page.makeHeaderViews(),
        sectionHeaderHeights: makeSectionHeaderHeights(page: page),
        estimatedSectionHeaderHeights: makeEstimatedSectionHeaderHeights(page: page),
        didSelect: didSelect)
    return TableViewDelegate(model: delegateModel)
}

// MARK: - Header Views

//func makeHeaderViews(page: Page) -> [UIView?]
//{
//    let headerModels = makeHeaderViewModels(type: type)
//    return headerModels.map {
//        makeTableViewSectionHeader(model: $0)
//    }
//}

// MARK: - Header View Models

//func makeHeaderViewModels(page: Page) -> [TableViewHeaderModel]
//{
//    switch type {
//    case .systemDetail:
//        return SystemDetailSectionHeader.allCases.map {
//            makeHeaderViewModel(sectionHeader: $0)
//        }
//    case .flowDetail:
//        return FlowDetailSectionHeader.allCases.map {
//            makeHeaderViewModel(sectionHeader: $0)
//        }
//    case .dashboard:
//        return DashboardSectionHeader.allCases.map {
//            makeHeaderViewModel(sectionHeader: $0)
//        }
//    default:
//        return []
//    }
//}

// MARK: - Header View Model

func makeHeaderViewModel(sectionHeader: SectionHeader) -> TableViewHeaderModel
{
    TableViewHeaderModel(
        hasDisclosureTriangle: sectionHeader.hasDisclosureTriangle,
        image: sectionHeader.icon?.getImage(),
        title: sectionHeader.title,
        hasSearchButton: sectionHeader.hasSearchButton,
        hasLinkButton: sectionHeader.hasLinkButton,
        hasAddButton: sectionHeader.hasAddButton,
        hasEditButton: sectionHeader.hasEditButton)
}

// MARK: - Header Heights

func makeSectionHeaderHeights(page: Page) -> [CGFloat]
{
    return makeEstimatedSectionHeaderHeights(page: page)
}

// MARK: - Estimated Header Heights

func makeEstimatedSectionHeaderHeights(page: Page) -> [CGFloat]
{
    if let tab = page.kind as? TabType
    {
        switch tab
        {
        case .dashboard:
            return SectionHeader.dashboard.count.map { 44 }
        case .library, .settings, .inbox:
            return [0]
        }
    }
    
    if let entity = page.kind as? EntityType
    {
        switch (entity, page.modifier)
        {
        case (.system, .detail):
            return SectionHeader.systemDetail.count.map { 44 }
        case (.flow, .detail):
            return SectionHeader.flowDetail.count.map { 44 }
        case (_, .list):
            return [0]
        default:
            assertionFailure("Passed an unhandled entity to section heights: \(page)")
            return []
        }
    }
    
    preconditionFailure("Should not reach here")
}

// MARK: - Data Source

func makeTableViewDataSource(
    page: Page,
    context: Context)
-> TableViewDataSource
{
    let cellModels = makeCellModels(page: page, context: context)
    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
    return TableViewDataSource(model: dataSourceModel)
}

// MARK: - Cell Model Types

func makeCellModelTypes(page: Page) -> [TableViewCellModel.Type]
{
    if let tab = page.kind as? TabType
    {
        switch tab
        {
        case .dashboard:
            return [
                PinnedListCellModel.self,
                EventListCellModel.self,
                FlowListCellModel.self
            ]
        case .library:
            return [LibraryCellModel.self]
        case .settings:
            return []
        case .inbox:
            return []
        }
    }
    
    if let entity = page.kind as? EntityType
    {
        switch (entity, page.modifier)
        {
        case (.system, .list):
            return [SystemListCellModel.self]
        case (.system, .detail):
            return [
                IdealCellModel.self,
                TitleEditCellModel.self,
                FlowListCellModel.self,
                EventListCellModel.self,
                NoteListCellModel.self
            ]
        case (.flow, .list):
            return [FlowListCellModel.self]
        case (.flow, .detail):
            return [
                TitleEditCellModel.self,
                DetailCellModel.self
            ]
        default:
            assertionFailure("Unhandled cell model type: \(page)")
            return []
        }
    }
    
    preconditionFailure("Should not reach here")
}

// MARK: - Cell Models

func makeCellModels(page: Page, context: Context) -> [[TableViewCellModel]]
{
    if let tab = page.kind as? TabType
    {
        switch tab
        {
        case .dashboard:
            return [
                makePinnedModels(context: context),
                [],
                makeForecastModels(context: context),
                []
            ]
        case .library:
            let cellModels = EntityType.libraryVisible.map {
                makeLibraryCellModel(for: $0, context: context)
            }
            return [cellModels]
        case .inbox:
            return []
        case .settings:
            return []
        }
    }
    
    if let entity = page.kind as? EntityType
    {
        switch (entity, page.modifier)
        {
        case (.system, .list):
            return makeSystemsListTableViewCellModels(context: context)
        case (.system, .detail(let system)):
            guard let system = system as? System else
            {
                assertionFailure("Failed to convert the entity to a system: \(page)")
                return []
            }
            return makeSystemDetailTableViewDataSourceModels(system: system)
        case (.flow, .list):
            let flows = getItemsForList(context: context, type: TransferFlow.self)
            let cellModels: [FlowListCellModel] = flows.map {
                FlowListCellModel(
                    title: $0.title,
                    fromName: $0.inflowForStock?.title ?? "None",
                    toName: $0.outflowForStock?.title ?? "None", flowAmount: $0.amount)
                
            }
            return [cellModels]
        case (.flow, .detail(let flow)):
            guard let flow = flow as? TransferFlow else { return [] }
            // TODO: The subscriptions and history cells are hard coded
            return [
                [
                    TitleEditCellModel(text: flow.title, placeholder: "Title"),
                    DetailCellModel(title: "Amount", detail: "\(flow.amount)"),
                    DetailCellModel(title: "From", detail: flow.from?.title ?? "None"),
                    DetailCellModel(title: "To", detail: flow.to?.title ?? "None"),
                    DetailCellModel(title: "Duration", detail: "\(flow.duration)")
                ],
                [
                    DetailCellModel(title: "Subscriptions", detail: "2 flows")
                ],
                [
                    DetailCellModel(title: "April 1, 2020", detail: "-9.99"),
                    DetailCellModel(title: "March 1, 2020", detail: "-9.99")
                ]
            ] as! [[TableViewCellModel]]
        default:
            assertionFailure("Unhandled cell model creation: \(page)")
            return []
        }
    }
    
    return []
}

func cellModelType(for entityType: EntityType) -> AnyClass
{
    switch entityType
    {
    case .system:
        return SystemListCellModel.cellClass
    case .flow:
        return FlowListCellModel.cellClass
    case .event:
        return EventListCellModel.cellClass
    case .note:
        return NoteListCellModel.cellClass
    default:
        return SystemListCellModel.cellClass // TODO: Add other cell types
    }
}

// MARK: - Cell Model

func makeCellModel(for type: AnyClass, object: NSManagedObject) -> TableViewCellModel?
{
    switch type
    {
    case is SystemListCell.Type:
        guard let system = object as? System else {
            assertionFailure("Failed to convert the object: \(object) to a system")
            return nil
        }
        
        let ideal = system.ideal?.computedValue as? Double ?? 0
        
        return SystemListCellModel(
            title: system.title,
            percentIdeal: ideal)
    default:
        assertionFailure("Cell model could not be created for: \(type)")
        return nil
    }
}

/**
 Not to be confused with the `makeSearchController:delegate ` function.
 */
func makeSearchController() -> UISearchController
{
    let delegate = SearchBarDelegate()
    return makeSearchController(searchBarDelegate: delegate)
}

// MARK: - Tapping on stuff

func makeAddActionClosure(
    page: Page,
    controller: ViewController,
    context: Context)
-> ActionClosure
{
    ActionClosure { sender in
        // TODO: How to customize action controller by type?
        // TODO: We need to route the list page to the detail pages..
        
        guard let typeOfEntity = page.kind as? EntityType else {
            return
        }
        
        let entity = typeOfEntity.insertNewEntity(into: context)
        let page = Page(
            kind: typeOfEntity,
            modifier: .detail(entity: entity))
        
        let detailController = makeDetailController(
            page: page,
            context: context)
        
        // TODO: Use the completion with the action closure
        controller.navigationController?.present(
            detailController,
            animated: true,
            completion: nil)
    }
}

// TODO: A function that returns the "created" controller
// for use in navigation instead of doing the creation and
// navigation here
func makeDidSelect(
    page: Page,
    controller: ViewController,
    context: Context)
-> TableViewSelectionClosure
{
    if let kind = page.kind as? TabType, kind == .dashboard
    {
        return makeDashboardRootViewDidSelectAction(controller: controller, context: context)
    }
    else if let kind = page.kind as? TabType, kind == .library
    {
        return makeLibraryRootViewControllerSelectionClosure(controller: controller, context: context)
    }
    
    return { selection in
        
        guard let typeOfEntity = page.kind as? EntityType else {
            return
        }
        
        let typeOfManagedObject = typeOfEntity.managedObjectType
        
        guard let entity = getItemInList(
                at: selection.indexPath,
                context: context,
                type: typeOfManagedObject) else {
            assertionFailure("Failed to find the proper entity at: \(selection.indexPath) for: \(typeOfManagedObject)")
            return
        }
        
        let detailPage = Page(kind: typeOfEntity, modifier: .detail(entity: entity))
        
        let detail = makeDetailController(
            page: detailPage,
            context: context)
        
        controller.navigationController?.pushViewController(
            detail,
            animated: true)
    }
}
