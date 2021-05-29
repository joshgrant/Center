//
//  SystemList.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import Foundation
import CoreData
import UIKit

//func makeSystemsListTableViewDelegate(didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegate
//{
//    let delegateModel = TableViewDelegateModel(
//        headerViews: nil,
//        sectionHeaderHeights: nil,
//        estimatedSectionHeaderHeights: nil,
//        didSelect: didSelect)
//    return TableViewDelegate(model: delegateModel)
//}

func makeSystemsListTableViewCellModels(context: Context) -> [[TableViewCellModel]]
{
    let systems = getItemsForList(context: context, type: System.self)
    let cellModels: [SystemListCellModel] = systems.map { system in
        let ideal = system.ideal?.computedValue as? Double ?? 0
        return SystemListCellModel(title: system.title, percentIdeal: ideal)
    }
    return [cellModels]
}

//func makeSystemsListTableViewDataSource(context: Context) -> TableViewDataSource
//{
//    let cellModels = makeSystemsListTableViewCellModels(context: context)
//    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
//    return TableViewDataSource(model: dataSourceModel)
//}

//func makeSystemsListCellModelTypes() -> [TableViewCellModel.Type]
//{
//    [SystemListCellModel.self]
//}

//func makeSystemsListTableViewModel(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewModel
//{
//    TableViewModel(
//        delegate: makeSystemsListTableViewDelegate(didSelect: didSelect),
//        dataSource: makeSystemsListTableViewDataSource(context: context),
//        cellModelTypes: makeSystemsListCellModelTypes())
//}

//func makeSystemListSelectionClosure(controller: ViewController, context: Context) -> TableViewSelectionClosure
//{
//    return { selection in
//
//        // Now we have to get the model, to get the item that was selected...
//        // Can we include the model in the call back?
//        guard let system = getItemInList(
//                at: selection.indexPath,
//                context: context,
//                type: System.self) else {
//            assertionFailure("Failed to find the proper system at: \(selection.indexPath)")
//            return
//        }
//
//        // Hmm.. not really updating the app state, are we?
//        let detail = makeSystemDetailViewController(system: system)
//        controller.navigationController?.pushViewController(detail, animated: true)
//    }
//}


//func makeSystemsListPage(context: Context) -> ViewController
//{
////    let controller = ViewController()
////
////    let didSelect = makeSystemListSelectionClosure(controller: controller, context: context)
////    let model = makeSystemsListTableViewModel(context: context, didSelect: didSelect)
////    let tableView = makeTableView(from: model)
////
////    controller.view = tableView
////
////    // This is duplicated a lot...
////    let delegate = SystemsListSearchBarDelegate()
////    let searchController = makeSearchController(searchBarDelegate: delegate)
////    controller.navigationItem.searchController = searchController
////    controller.navigationItem.hidesSearchBarWhenScrolling = true
//
//    let actionClosure = makeSystemListAddActionClosure(controller: controller, context: context)
//    // TODO: The action closure is probably getting released because there are no
//    // references to it...
//    controller.actionClosures.insert(actionClosure)
//    controller.navigationItem.rightBarButtonItem = makeListAddButton(actionClosure: actionClosure)
//
//    controller.title = "Systems"
//
//    return controller
//}

//func makeSystemListAddActionClosure(controller: ViewController, context: Context) -> ActionClosure
//{
//    ActionClosure { sender in
//        // Add a new system!
//        // Insert the new table view cell!
//        // Open the new system page!
//
//        let system = System(context: context)
//        // Open up the new system page
//
//        let systemDetailController = makeSystemDetailViewController(system: system)
//        // TODO: Should it present, or should it just push? If it pushes, we need to add
//        // the cell to the table view first. But if they decide not to create the system,
//        // then they should hit "cancel" and it won't insert a cell..
//
//        // I think present makes more sense, but if they continue to edit the system, then
//        // it'll get complicated. Should there be another view for just the basic information,
//        // i.e name?
//        controller.navigationController?.present(systemDetailController, animated: true, completion: nil)
//
//        // Should modify the app state rather than presenting a new detail controller
//    }
//}
