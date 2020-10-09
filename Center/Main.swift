//
//  Main.swift
//  Center
//
//  Created by Joshua Grant on 10/9/20.
//

import UIKit
import Core
import Schema
import Architecture

public struct TableViewModel
{
    var style: UITableView.Style = .grouped
    
    var delegate: TableViewDelegate
    var dataSource: TableViewDataSource
    
    var cellModelTypes: [TableViewCellModel.Type]
}

public struct TableViewDataSourceModel // TODO: Rename to TableViewDataSource
{
    var cellModels: [[TableViewCellModel]]
    
    var numberOfRows: [Int] {
        cellModels.map {
            $0.count
        }
    }
}

public func makeTableView(from tableViewModel: TableViewModel) -> TableView
{
    let tableView = TableView(frame: .zero, style: tableViewModel.style)
    
    tableView.delegate = tableViewModel.delegate
    tableView.dataSource = tableViewModel.dataSource
    
    tableViewModel.cellModelTypes.forEach {
        tableView.register($0.cellClass, forCellReuseIdentifier: $0.cellReuseIdentifier)
    }
    
    return tableView
}

// LIBRARY LIST

func makeLibraryListTableDelegate(context: Context) throws -> TableViewDelegate
{
    let model = TableViewDelegateModel(
        headerViews: nil,
        sectionHeaderHeights: nil,
        estimatedSectionHeaderHeights: nil)
    return TableViewDelegate(model: model)
}

func makeLibraryListTableDataSource(context: Context) throws -> TableViewDataSource
{
    let data = try makeLibraryListTableData(context: context)
    return makeTableViewDataSource(with: data)
}

func makeLibraryListTableViewCellModelTypes() -> [TableViewCellModel.Type]
{
    [LibraryListCellModel.self]
}

func makeLibraryListTableData(context: Context) throws -> TableViewDataSourceModel
{
    let models = try makeLibraryListCellModels(context: context)
    return TableViewDataSourceModel(cellModels: models)
}

func makeLibraryListTableDataModel(context: Context) throws -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: try makeLibraryListTableDelegate(context: context),
        dataSource: try makeLibraryListTableDataSource(context: context),
        cellModelTypes: makeLibraryListTableViewCellModelTypes())
}

func makeLibraryListCellModels(context: Context) throws -> [[TableViewCellModel]]
{
    let cellModels = try EntityType.allCases.map {
        try makeLibraryListCellModel(for: $0, context: context)
    }
    
    return [cellModels]
}

func makeLibraryListCellModel(for entityType: EntityType, context: Context) throws -> LibraryListCellModel
{
    LibraryListCellModel(
        image: imageForEntityType(entityType),
        title: titleForEntityType(entityType),
        count: try countForEntityType(entityType, context: context))
}

// DASHBOARD

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

// GENERIC

func makeTableViewDataSource(with model: TableViewDataSourceModel) -> TableViewDataSource
{
    TableViewDataSource(model: model)
}

func makeCell(
    in tableView: UITableView,
    at indexPath: IndexPath,
    with model: TableViewCellModel) -> UITableViewCell
{
    let identifier = type(of: model).cellReuseIdentifier
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    
    if let cell = cell as? TableViewCell
    {
        cell.configureWithViewModel(model)
    }
    
    return cell
}

/// TABLE VIEW DELEGATE

public struct TableViewDelegateModel
{
    var headerViews: [UIView?]?
    var sectionHeaderHeights: [CGFloat]?
    var estimatedSectionHeaderHeights: [CGFloat]?
}
