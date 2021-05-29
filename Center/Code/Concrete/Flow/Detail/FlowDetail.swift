//
//  FlowDetail.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import UIKit

//func makeFlowDetailViewController(flow: TransferFlow) -> ViewController
//{
////    let viewController = ViewController()
//
//    let didSelect = makeFlowDetailTableViewSelectionClosure()
//
//    let model = makeFlowDetailTableViewModel(flow: flow, didSelect: didSelect)
//    viewController.view = makeTableView(from: model)
//
//    return viewController
//}

//func makeFlowDetailTableViewModel(flow: TransferFlow, didSelect: @escaping TableViewSelectionClosure) -> TableViewModel
//{
//    TableViewModel(
//        style: .grouped,
//        delegate: makeFlowDetailTableViewDelegate(didSelect: didSelect),
//        dataSource: makeFlowDetailTableViewDataSource(flow: flow),
//        cellModelTypes: makeFlowDetailCellModelTypes())
//}

//func makeFlowDetailTableViewDelegate(didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegate
//{
//    let model = makeFlowDetailTableViewDelegateModel(didSelect: didSelect)
//    return TableViewDelegate(model: model)
//}

//func makeFlowDetailSectionHeaderHeights() -> [CGFloat]
//{
//    FlowDetailSectionHeader.allCases.count.map { 44 }
//}

//func makeFlowDetailTableViewDelegateModel(didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegateModel
//{
//    TableViewDelegateModel(
//        headerViews: makeFlowDetailTableViewHeaderViews(),
//        sectionHeaderHeights: makeFlowDetailSectionHeaderHeights(),
//        estimatedSectionHeaderHeights: makeFlowDetailSectionHeaderHeights(),
//        didSelect: didSelect)
//}

//func makeFlowDetailTableViewDataSource(flow: Flow) -> TableViewDataSource
//{
//    let model = makeFlowDetailTableViewDataSourceModel(flow: flow)
//    return TableViewDataSource(model: model)
//}

//func makeFlowDetailTableViewDataSourceModel(flow: Flow) -> TableViewDataSourceModel
//{
//    let cellModels = makeFlowDetailTableViewCellModels(flow: flow)
//    return TableViewDataSourceModel(cellModels: cellModels)
//}

//func makeFlowDetailTableViewCellModels(flow: Flow) -> [[TableViewCellModel]]
//{
//    [
//        [
//            TitleEditCellModel(text: "", placeholder: "Test"),
//            DetailCellModel(title: "Amount", detail: "9.99"),
//            DetailCellModel(title: "From", detail: "USD"),
//            DetailCellModel(title: "To", detail: "Out"),
//            DetailCellModel(title: "Duration", detail: "None")
//        ],
//        [
//            DetailCellModel(title: "Subscriptions", detail: "2 flows")
//        ],
//        [
//            DetailCellModel(title: "April 1, 2020", detail: "-9.99"),
//            DetailCellModel(title: "March 1, 2020", detail: "-9.99")
//        ]
//    ] as! [[TableViewCellModel]]
//}

//func makeFlowDetailCellModelTypes() -> [TableViewCellModel.Type]
//{
//    // 1. Title edit
//    // 2. Detail
//    // 3. Toggle with info
//    // 4. Detail with chevron
//    // 5. History list
//    [TitleEditCellModel.self, DetailCellModel.self]
//}

//func makeFlowDetailTableViewHeaderViews() -> [UIView]
//{
//    let headerModels = makeFlowDetailTableViewHeaderModels()
//    return headerModels.map {
//        makeTableViewSectionHeader(model: $0)
//    }
//}

//func makeFlowDetailTableViewHeaderModels() -> [TableViewHeaderModel]
//{
//    FlowDetailSectionHeader.allCases.map {
//        TableViewHeaderModel(title: title(flowDetailSectionHeader: $0))
//    }
//}
