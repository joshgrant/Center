//
//  Dashboard.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import Foundation
import Architecture
import UIKit

func makeDashboardTableViewCellModelTypes() -> [TableViewCellModel.Type]
{
    [PinnedListCellModel.self, EventListCellModel.self]
}

func makeDashboardTableViewHeaderModels() -> [TableViewHeaderModel]
{
    DashboardSectionHeader.allCases.map {
        $0.makeHeaderModel()
    }
}

func makeTableViewSectionHeader(model: TableViewHeaderModel) -> View
{
    let view = View(frame: CGRect(origin: .zero, size: .init(width: 30, height: 30)))
    view.backgroundColor = .systemGroupedBackground
    
    let stackViewFactory = TableViewSectionHeaderViewFactory(sectionHeaderModel: model)
    
    let stackView = stackViewFactory.makeMainStackView()
    view.embed(stackView)
    
    return view
}

func makeDashboardTableViewHeaderViews() -> [UIView?]
{
    let models = makeDashboardTableViewHeaderModels()
    return models.map {
        makeTableViewSectionHeader(model: $0)
    }
}

func makeDashboardTableViewDelegateModel() -> TableViewDelegateModel
{
    let headerHeights: [CGFloat] = DashboardSectionHeader.allCases.count.map { 44 }
    
    return TableViewDelegateModel(
        headerViews: makeDashboardTableViewHeaderViews(),
        sectionHeaderHeights: headerHeights,
        estimatedSectionHeaderHeights: headerHeights)
}

func makeDashboardTableViewDelegate() -> TableViewDelegate
{
    TableViewDelegate(model: makeDashboardTableViewDelegateModel())
}

func makeDashboardTableViewCellModels() -> [[TableViewCellModel]]
{
    // TODO:
    return [[]]
}

func makeDashboardTableViewDataSourceModel() -> TableViewDataSourceModel
{
    TableViewDataSourceModel(cellModels: makeDashboardTableViewCellModels())
}

func makeDashboardTableViewDataSource() -> TableViewDataSource
{
    TableViewDataSource(model: makeDashboardTableViewDataSourceModel())
}

func makeDashboardTableViewModel() -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeDashboardTableViewDelegate(),
        dataSource: makeDashboardTableViewDataSource(),
        cellModelTypes: makeDashboardTableViewCellModelTypes())
}

/**
 init(headerModelFactory: DashboardViewHeaderModelFactory,
 cellModelFactory: DashboardViewCellModelFactory)
 {
 self.headerModelFactory = headerModelFactory
 self.cellModelFactory = cellModelFactory
 }
 
 static func cellClassAndReuseIdentifiers() -> [TableViewCellModel.Type]
 {
 [EventListCellModel.self, PinnedListCellModel.self]
 }
 
 func numberOfSections(in tableView: UITableView) -> Int
 {
 return headerModelFactory.headerModels.count
 }
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
 {
 // TODO: Cache this value
 return cellModelFactory.makeCellModels()[section].count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
 {
 // TODO: Cache this value
 let model = cellModelFactory.makeCellModels()[indexPath.section][indexPath.row]
 let identifier = type(of: model).cellReuseIdentifier
 let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
 
 if let cell = cell as? TableViewCell
 {
 cell.configureWithViewModel(model)
 }
 
 return cell
 }
 */
