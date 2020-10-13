//
//  Dashboard.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import UIKit

func makeDashboardTableViewCellModelTypes() -> [TableViewCellModel.Type]
{
    [PinnedListCellModel.self, EventListCellModel.self]
}

func makeDashboardTableViewHeaderModels(context: Context) -> [TableViewHeaderModel]
{
    DashboardSectionHeader.allCases.map {
        makeTableViewHeaderModel(dashboardSectionHeader: $0)
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

func makeDashboardTableViewHeaderViews(context: Context) -> [UIView?]
{
    let models = makeDashboardTableViewHeaderModels(context: context)
    return models.map {
        makeTableViewSectionHeader(model: $0)
    }
}

func makeDashboardTableViewDelegateModel(context: Context) -> TableViewDelegateModel
{
    let headerHeights: [CGFloat] = DashboardSectionHeader.allCases.count.map { 44 }
    
    return TableViewDelegateModel(
        headerViews: makeDashboardTableViewHeaderViews(context: context),
        sectionHeaderHeights: headerHeights,
        estimatedSectionHeaderHeights: headerHeights)
}

func makeDashboardTableViewDelegate(context: Context) -> TableViewDelegate
{
    TableViewDelegate(model: makeDashboardTableViewDelegateModel(context: context))
}

func makeDashboardTableViewDataSourceModel(context: Context) -> TableViewDataSourceModel
{
    TableViewDataSourceModel(cellModels: makeDashboardCellModels(context: context))
}

func makeDashboardTableViewDataSource(context: Context) -> TableViewDataSource
{
    TableViewDataSource(model: makeDashboardTableViewDataSourceModel(context: Context))
}

func makeDashboardTableViewModel(context: Context) -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeDashboardTableViewDelegate(context: context),
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
