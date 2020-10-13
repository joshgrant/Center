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
        guard let system = systemInSystemList(at: selection.indexPath, context: context) else {
            assertionFailure("Failed to find the proper system at: \(selection.indexPath)")
            return
        }
        
        let detailController = makeSystemDetailViewController(system: system)
        controller
            .navigationController?
            .pushViewController(detailController, animated: true)
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
    
    let actionClosure = makeSystemListAddActionClosure(context: context, controller: controller)
    // TODO: The action closure is probably getting released because there are no
    // references to it...
    controller.navigationItem.rightBarButtonItem = makeSystemListAddButton(actionClosure: actionClosure)
    
    return controller
}

func makeSystemListAddActionClosure(context: Context, controller: ViewController) -> ActionClosure
{
    return ActionClosure { sender in
        // Add a new system!
        // Insert the new table view cell!
        // Open the new system page!
        
        let system = System(context: context)
        // Open up the new system page
        
        let systemDetailController = makeSystemDetailViewController(system: system)
        // TODO: Should it present, or should it just push? If it pushes, we need to add
        // the cell to the table view first. But if they decide not to create the system,
        // then they should hit "cancel" and it won't insert a cell..
        
        // I think present makes more sense, but if they continue to edit the system, then
        // it'll get complicated. Should there be another view for just the basic information,
        // i.e name?
        controller.navigationController?.present(systemDetailController, animated: true, completion: nil)
    }
}

func makeSystemListAddButton(actionClosure: ActionClosure) -> UIBarButtonItem
{
    let button = UIBarButtonItem(systemItem: .add)
    button.target = actionClosure
    button.action = #selector(actionClosure.perform(sender:))
    return button
}

typealias ActionPerformClosure = ((_ sender: Any) -> Void)

class ActionClosure
{
    var performClosure: ActionPerformClosure
    
    init(performClosure: @escaping ActionPerformClosure)
    {
        self.performClosure = performClosure
    }
    
    @objc func perform(sender: Any)
    {
        performClosure(sender)
    }
}
