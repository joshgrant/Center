//
//  Router.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import Foundation
import UIKit
import CoreData

enum ViewControllerType
{
    case nonType
    
    case dashboard
    case library
    case inbox
    case settings // Have a nested enum here
    
    case systemList
    case systemDetail(system: System?)
    
    case stockList
    case stockDetail
    
    case amountDetail
    
    case flowList
    case flowDetail
    
    case eventList
    case eventDetail
    
    case conditionList
    case conditionDetail
    
    case noteList
    case noteDetail
    case noteInfo
    
    case processList
    case processDetail
    
    case conversionList
    case conversionDetail
    
    case dimensionList
    case unitList
    case unitDetail
    
    case symbolList
    case symbolDetail
    
    case search
    case searchFilter
}

func viewControllerType(for entityType: EntityType, detail: Bool) -> ViewControllerType?
{
    switch (entityType, detail)
    {
    case (.system, true): return .systemDetail(system: nil)
    case (.system, false): return .systemList
    case (.stock, true): return .stockDetail
    case (.stock, false): return .stockList
    case (.flow, true): return .flowDetail
    case (.flow, false): return .flowList
    case (.event, true): return .eventDetail
    case (.event, false): return .eventList
    case (.process, true): return .processDetail
    case (.process, false): return .processList
    case (.conversion, true): return .conversionDetail
    case (.conversion, false): return .conversionList
    case (.dimension, false): return .dimensionList
    case (.dimension, true): return .unitList // TODO: Not ideal
    case (.symbol, true): return .symbolDetail
    case (.symbol, false): return .symbolList
    case (.unit, true): return .unitDetail
    case (.unit, false): return .unitList
    case (.note, true): return .noteDetail
    case (.note, false): return .noteList
    case (.condition, true): return .conditionDetail
    case (.condition, false): return .conditionList
    case (.nonEntity, _): return .systemList
    }
}

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

func entityType(for viewControllerType: ViewControllerType) -> EntityType?
{
    switch viewControllerType
    {
    case .systemList, .systemDetail: return .system
    case .stockList, .stockDetail: return .stock
    case .flowList, .flowDetail: return .flow
    case .eventList, .eventDetail: return .event
    case .conditionList, .conditionDetail: return .condition
    case .noteList, .noteDetail, .noteInfo: return .note
    case .processList, .processDetail: return .process
    case .conversionList, .conversionDetail: return .conversion
    case .dimensionList: return .dimension
    case .unitList, .unitDetail: return .unit
    case .symbolList, .symbolDetail: return .symbol
    case .dashboard,
         .library,
         .inbox,
         .settings,
         .amountDetail,
         .search,
         .searchFilter,
         .nonType:
        return .nonEntity
    }
}

func detailControllerType(for type: ViewControllerType, entity: NSManagedObject) -> ViewControllerType?
{
    switch type {
    case .systemList: return .systemDetail(system: entity as? System)
    case .stockList: return .stockDetail
    case .flowList: return .flowDetail
    case .eventList: return .eventDetail
    case .noteList: return .noteDetail
    case .processList: return .processDetail
    case .conversionList: return .conversionDetail
    case .conditionList: return .conditionDetail
    case .unitList: return .unitDetail
    case .symbolList: return .symbolDetail
    case .dashboard, .library, .inbox, .settings, .systemDetail, .stockDetail, .amountDetail, .flowDetail, .eventDetail, .conditionDetail, .noteDetail, .noteInfo, .processDetail, .conversionDetail, .dimensionList, .unitDetail, .search, .searchFilter, .symbolDetail, .nonType:
        return .nonType
        // TODO: Dimension list?
    }
}

func title(for type: ViewControllerType) -> String
{
    // TODO: Pluralize if necessary
    return String(describing: type)
        .split { $0.isUppercase }
        .first?
        .localizedCapitalized
        ?? String(describing: type)
}

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

public func makeSearchController(searchBarDelegate: UISearchBarDelegate) -> UISearchController
{
    let searchResultsController = SearchViewController()
    let searchController = UISearchController(searchResultsController: searchResultsController)
    searchController.searchBar.delegate = searchBarDelegate
    return searchController
}

func makeDetailController(type: ViewControllerType, entity: NSManagedObject, context: Context) -> ViewController
{
    let viewController = ViewController()
    
    let didSelect = makeDidSelect(type: type, controller: viewController, context: context)
    let tableViewModel = makeTableViewModel(type: type, context: context, didSelect: didSelect)
    let tableView = makeTableView(from: tableViewModel)
    
    // TODO: Maybe use the title of the entity?
    viewController.title = title(for: type)
    viewController.view = tableView
    
    return viewController
}

func makeListController(
    type: ViewControllerType,
    context: Context)
-> ViewController
{
    let controller = ViewController()
    
    // TODO: Optional depending on ViewControllerType
    let didSelect = makeDidSelect(
        type: type,
        controller: controller,
        context: context)
    
    // TODO: Not necessarily a table view model
    let model = makeTableViewModel(
        type: type,
        context: context,
        didSelect: didSelect)
    
    let tableView = makeTableView(from: model)
    
    controller.view = tableView
    
    // TODO: Only if the the ViewControllerType has a search bar
    let searchController = makeSearchController(type: type)
    controller.navigationItem.searchController = searchController
    controller.navigationItem.hidesSearchBarWhenScrolling = true
    
    let actionClosure = makeAddActionClosure(
        type: type,
        controller: controller,
        context: context)
    
    controller.actionClosures.insert(actionClosure)
    controller.navigationItem.rightBarButtonItem = makeListAddButton(actionClosure: actionClosure)
    
    controller.title = title(for: type)
    
    return controller
}

func makeTableViewModel(
    type: ViewControllerType,
    context: Context,
    didSelect: @escaping TableViewSelectionClosure)
-> TableViewModel
{
    TableViewModel(
        delegate: makeTableViewDelegate(
            type: type,
            didSelect: didSelect),
        dataSource: makeTableViewDataSource(
            type: type,
            context: context),
        cellModelTypes: makeCellModelTypes(type: type))
}

func makeTableViewDelegate(
    type: ViewControllerType,
    didSelect: @escaping TableViewSelectionClosure)
-> TableViewDelegate
{
    let delegateModel = TableViewDelegateModel(
        headerViews: makeHeaderViews(type: type),
        sectionHeaderHeights: makeSectionHeaderHeights(type: type),
        estimatedSectionHeaderHeights: makeEstimatedSectionHeaderHeights(type: type),
        didSelect: didSelect)
    return TableViewDelegate(model: delegateModel)
}

func makeHeaderViews(type: ViewControllerType) -> [UIView?]
{
    let headerModels = makeHeaderViewModels(type: type)
    return headerModels.map {
        makeTableViewSectionHeader(model: $0)
    }
}

func makeHeaderViewModels(type: ViewControllerType) -> [TableViewHeaderModel]
{
    switch type {
    case .systemDetail:
        return SystemDetailSectionHeader.allCases.map {
            makeHeaderViewModel(sectionHeader: $0)
        }
    default:
        return []
    }
}

func makeHeaderViewModel(sectionHeader: SectionHeader) -> TableViewHeaderModel
{
    TableViewHeaderModel(
        hasDisclosureTriangle: hasDisclosureTriangle(sectionHeader: sectionHeader),
        image: image(sectionHeader: sectionHeader),
        title: title(sectionHeader: sectionHeader),
        hasSearchButton: hasSearchButton(sectionHeader: sectionHeader),
        hasLinkButton: hasLinkButton(sectionHeader: sectionHeader),
        hasAddButton: hasAddButton(sectionHeader: sectionHeader),
        hasEditButton: hasEditButton(sectionHeader: sectionHeader))
}

func makeSectionHeaderHeights(type: ViewControllerType) -> [CGFloat]
{
    return makeEstimatedSectionHeaderHeights(type: type)
}

func makeEstimatedSectionHeaderHeights(type: ViewControllerType) -> [CGFloat]
{
    switch type {
    case .systemDetail:
        return SystemDetailSectionHeader.allCases.count.map { 44 }
    default:
        return [0]
    }
}

func makeTableViewDataSource(
    type: ViewControllerType,
    context: Context)
-> TableViewDataSource
{
    let cellModels = makeCellModels(type: type, context: context)
    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
    return TableViewDataSource(model: dataSourceModel)
}

func makeCellModelTypes(type: ViewControllerType) -> [TableViewCellModel.Type]
{
    switch type {
    case .systemList, .nonType: return [SystemListCellModel.self]
    case .dashboard:
        return []
    case .library:
        return []
    case .inbox:
        return []
    case .settings:
        return []
    case .systemDetail:
        return [
            IdealCellModel.self,
            TitleEditCellModel.self,
            FlowListCellModel.self,
            EventListCellModel.self,
            NoteListCellModel.self
        ]
    case .stockList:
        return []
    case .stockDetail:
        return []
    case .amountDetail:
        return []
    case .flowList:
        return []
    case .flowDetail:
        return []
    case .eventList:
        return []
    case .eventDetail:
        return []
    case .conditionList:
        return []
    case .conditionDetail:
        return []
    case .noteList:
        return []
    case .noteDetail:
        return []
    case .noteInfo:
        return []
    case .processList:
        return []
    case .processDetail:
        return []
    case .conversionList:
        return []
    case .conversionDetail:
        return []
    case .dimensionList:
        return []
    case .unitList:
        return []
    case .unitDetail:
        return []
    case .symbolList:
        return []
    case .symbolDetail:
        return []
    case .search:
        return []
    case .searchFilter:
        return []
    }
}

func makeCellModels(type: ViewControllerType, context: Context) -> [[TableViewCellModel]]
{
    switch type
    {
    case .dashboard:
        return makeDashboardCellModels(context: context)
    case .library:
        return makeLibraryCellModels(context: context)
    case .nonType:
        return []
    case .inbox:
        return []
    case .settings:
        return []
    case .systemList:
        return makeSystemsListTableViewCellModels(context: context)
    case .systemDetail(let system):
        guard let system = system else { return [] }
        return makeSystemDetailTableViewDataSourceModels(system: system)
    case .stockList:
        return []
    case .stockDetail:
        return []
    case .amountDetail:
        return []
    case .flowList:
        return []
    case .flowDetail:
        return []
    case .eventList:
        return []
    case .eventDetail:
        return []
    case .conditionList:
        return []
    case .conditionDetail:
        return []
    case .noteList:
        return []
    case .noteDetail:
        return []
    case .noteInfo:
        return []
    case .processList:
        return []
    case .processDetail:
        return []
    case .conversionList:
        return []
    case .conversionDetail:
        return []
    case .dimensionList:
        return []
    case .unitList:
        return []
    case .unitDetail:
        return []
    case .symbolList:
        return []
    case .symbolDetail:
        return []
    case .search:
        return []
    case .searchFilter:
        return []
    }
    
    //    guard let typeOfEntity = entityType(for: type) else {
    //        return []
    //    }
    //
    //    let typeOfManagedObject = managedObjectType(for: typeOfEntity)
    //
    //    let entities = getItemsForList(
    //        context: context,
    //        type: typeOfManagedObject)
    //    let cellModels: [TableViewCellModel] = entities.map { object in
    //
    //        switch type
    //        {
    //        case .library:
    //            return makeLibraryCellModels(context: context)
    //        default:
    //            return nil
    //        }
    //    }
    //
    //    return [cellModels]
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
func makeSearchController(type: ViewControllerType) -> UISearchController
{
    let delegate = SearchBarDelegate()
    return makeSearchController(searchBarDelegate: delegate)
}

// MARK: - Tapping on stuff

func makeAddActionClosure(
    type: ViewControllerType,
    controller: ViewController,
    context: Context)
-> ActionClosure
{
    ActionClosure { sender in
        // TODO: How to customize action controller by type?
        // TODO: We need to route the list page to the detail pages..
        
        guard let typeOfEntity = entityType(for: type) else {
            return
        }
        
        let entity = addObject(of: typeOfEntity, into: context)
        
        guard let detailPageType = detailControllerType(for: type, entity: entity) else {
            return
        }
        
        let detailController = makeDetailController(
            type: detailPageType,
            entity: entity,
            context: context)
        
        // TODO: Use the completion with the action closure
        controller.navigationController?.present(
            detailController,
            animated: true,
            completion: nil)
    }
}

func makeDidSelect(
    type: ViewControllerType,
    controller: ViewController,
    context: Context)
-> TableViewSelectionClosure
{
    return { selection in
        
        guard let typeOfEntity = entityType(for: type) else {
            return
        }
        
        let typeOfManagedObject = managedObjectType(for: typeOfEntity)
        
        guard let entity = getItemInList(
                at: selection.indexPath,
                context: context,
                type: typeOfManagedObject) else {
            assertionFailure("Failed to find the proper entity at: \(selection.indexPath) for: \(typeOfManagedObject)")
            return
        }
        
        guard let detailType = detailControllerType(for: type, entity: entity) else {
            // TODO: Handle detail controller first?
            print(selection)
            return
        }
        
        let detail = makeDetailController(
            type: detailType,
            entity: entity,
            context: context)
        
        controller.navigationController?.pushViewController(
            detail,
            animated: true)
    }
}
