//
//  FlowList.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import UIKit
import CoreData

//func makeFlowListViewController(context: Context) -> ViewController
//{
//    let controller = ViewController()
//
//    let didSelect = makeFlowListSelectionClosure(controller: controller, context: context)
//    let model = makeFlowListTableViewModel(context: context, didSelect: didSelect)
//    let tableView = makeTableView(from: model)
//
//    controller.view = tableView
//
//    let actionClosure = makeFlowListAddActionClosure(controller: controller, context: context)
//    controller.actionClosures.insert(actionClosure)
//    controller.navigationItem.rightBarButtonItem = makeListAddButton(actionClosure: actionClosure)
//
//    controller.title = "Flows"
//
//    return controller
//}

//func makeFlowListSelectionClosure(controller: ViewController, context: Context) -> TableViewSelectionClosure
//{
//    return { selection in
//        print("Selected flow list cell: \(selection)")
//    }
//}
//
//func makeFlowListTableViewModel(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewModel
//{
//    TableViewModel(
//        style: .grouped,
//        delegate: makeFlowListTableViewDelegate(didSelect: didSelect),
//        dataSource: makeFlowListTableViewDataSource(context: context),
//        cellModelTypes: makeFlowListCellModelTypes())
//}

//func makeFlowListTableViewDelegate(didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegate
//{
//    return .init(model: makeFlowListTableViewDelegateModel(didSelect: didSelect))
//}

//func makeFlowListTableViewDelegateModel(didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegateModel
//{
//    return .init(
//        headerViews: nil,
//        sectionHeaderHeights: nil,
//        estimatedSectionHeaderHeights: nil,
//                 didSelect: didSelect)
//}

//func makeFlowListTableViewDataSource(context: Context) -> TableViewDataSource
//{
//    return .init(model: makeFlowListTableViewDataSourceModel(context: context))
//}
//
//func makeFlowListTableViewDataSourceModel(context: Context) -> TableViewDataSourceModel
//{
//    return .init(cellModels: makeFlowListTableViewCellModels(context: context))
//}

//func makeFlowListTableViewCellModels(context: Context) -> [[TableViewCellModel]]
//{
//    let flows = getItemsForList(context: context, type: TransferFlow.self)
//    let cellModels: [FlowListCellModel] = flows.map {
//        return FlowListCellModel(title: $0.title, fromName: $0.inflowForStock?.title ?? "None", toName: $0.outflowForStock?.title ?? "None", flowAmount: 0)
//    }
//    return [cellModels]
//}

//func makeFlowListCellModelTypes() -> [TableViewCellModel.Type]
//{
//    [FlowListCellModel.self]
//}

// MARK: - Add Button

//// Not a fan of an action rather than a state change...
//func makeFlowListAddActionClosure(controller: ViewController, context: Context) -> ActionClosure
//{
//    ActionClosure { sender in
//        let flow = TransferFlow(context: context)
//        let flowDetail = makeFlowDetailViewController(flow: flow)
//        controller.navigationController?.present(
//            flowDetail,
//            animated: true,
//            completion: nil)
//    }
//}
