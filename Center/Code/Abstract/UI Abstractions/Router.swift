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
    case dashboard
    case library
    case inbox
    case settings // Have a nested enum here
    
    case systemList
    case systemDetail
    
    case amountDetail
    
    case flowList
    case flowDetail
    
    case eventList
    case eventDetail
    
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

func entityType(for viewControllerType: ViewControllerType) -> EntityType?
{
    switch viewControllerType
    {
    case .systemList, .systemDetail: return .system
    case .flowList, .flowDetail: return .flow
    case .eventList, .eventDetail: return .event
    case .conditionDetail: return .condition
    case .noteList, .noteDetail, .noteInfo: return .note
    case .processList, .processDetail: return .process
    case .conversionList, .conversionDetail: return .conversion
    case .dimensionList: return .dimension
    case .unitList, .unitDetail: return .unit
    case .symbolList, .symbolDetail: return .symbol
    default:
        // TODO: Condition, amount
        return nil
    }
}

func detailPage(for type: ViewControllerType) -> ViewControllerType?
{
    switch type {
    case .systemList: return .systemDetail
    case .flowList: return .flowDetail
    case .eventList: return .eventDetail
    case .noteList: return .noteDetail
    case .processList: return .processDetail
    case .conversionList: return .conversionDetail
    case .unitList: return .unitDetail
    case .symbolList: return .symbolDetail
    default: return nil
    }
}

func title(for type: ViewControllerType) -> String
{
    // TODO: Pluralize if necessary
    return String(describing: type)
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

func makeDetailController(entity: NSManagedObject) -> ViewController
{
    
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
        
        let detail = makeDetailController(entity: entity)
        
        controller.navigationController?.pushViewController(
            detail,
            animated: true)
    }
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
    switch type {
    case .systemList: return []
    default:
        return []
    }
}

func makeSectionHeaderHeights(type: ViewControllerType) -> [CGFloat]
{
    switch type {
    case .systemList: return []
    default:
        return []
    }
}

func makeEstimatedSectionHeaderHeights(type: ViewControllerType) -> [CGFloat]
{
    switch type {
    case .systemList: return []
    default:
        return []
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
    case .systemList: return [SystemListCellModel.self]
    default:
        return [] // TODO: Add the other cell types
    }
}

func makeCellModels(type: ViewControllerType, context: Context) -> [[TableViewCellModel]]
{
    switch type {
    case .systemList:
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
        
        guard let detailPageType = detailPage(for: type) else {
            return
        }
        
        let detailController = makeDetailController(entity: entity)

        // TODO: Use the completion with the action closure
        controller.navigationController?.present(
            detailController,
            animated: true,
            completion: nil)
    }
}
