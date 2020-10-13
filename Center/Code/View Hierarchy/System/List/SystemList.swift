//
//  SystemList.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import Foundation
import CoreData
import UIKit

func makeSystemsListTableViewDelegate(didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegate
{
    let delegateModel = TableViewDelegateModel(
        headerViews: nil,
        sectionHeaderHeights: nil,
        estimatedSectionHeaderHeights: nil,
        didSelect: didSelect)
    return TableViewDelegate(model: delegateModel)
}

func getSystemsInSystemList(context: Context) -> [System]
{
    let fetchRequest: NSFetchRequest<System> = System.fetchRequest()
    do {
        return try context.fetch(fetchRequest)
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}

func makeSystemsListTableViewCellModels(context: Context) -> [[TableViewCellModel]]
{
    let systems = getSystemsInSystemList(context: context)
    let cellModels: [SystemListCellModel] = systems.map {
        let ideal = $0.ideal?.computedValue as? Double ?? 0
        return SystemListCellModel(title: $0.title, percentIdeal: ideal)
    }
    return [cellModels]
}

func makeSystemsListTableViewDataSource(context: Context) -> TableViewDataSource
{
    let cellModels = makeSystemsListTableViewCellModels(context: context)
    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
    return TableViewDataSource(model: dataSourceModel)
}

func makeSystemsListCellModelTypes() -> [TableViewCellModel.Type]
{
    [SystemListCellModel.self]
}

func makeSystemsListTableViewModel(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewModel
{
    TableViewModel(
        delegate: makeSystemsListTableViewDelegate(didSelect: didSelect),
        dataSource: makeSystemsListTableViewDataSource(context: context),
        cellModelTypes: makeSystemsListCellModelTypes())
}

func makeSystemListSelectionClosure(controller: ViewController, context: Context) -> TableViewSelectionClosure
{
    return { selection in
        
        // Now we have to get the model, to get the item that was selected...
        // Can we include the model in the call back?
        let system = systemInSystemList(at: selection.indexPath, context: context)
        // Make system controller (with system)
        // push the controller
        print(system)
        controller
            .navigationController?
            .pushViewController(UIViewController(), animated: true)
    }
}

func systemInSystemList(at indexPath: IndexPath, context: Context) -> System?
{
    let systems = getSystemsInSystemList(context: context)
    return systems[indexPath.row]
}

func makeSystemsListPage(context: Context) -> ViewController
{
    let controller = ViewController()
    
    let didSelect = makeSystemListSelectionClosure(controller: controller, context: context)
    let model = makeSystemsListTableViewModel(context: context, didSelect: didSelect)
    let tableView = makeTableView(from: model)
    
    controller.view = tableView
    
    // This is duplicated a lot...
    let delegate = SystemsListSearchBarDelegate()
    let searchController = makeSearchController(searchBarDelegate: delegate)
    controller.navigationItem.searchController = searchController
    controller.navigationItem.hidesSearchBarWhenScrolling = true
    
    return controller
}
