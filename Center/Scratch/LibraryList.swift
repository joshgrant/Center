//
//  LibraryList.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import Foundation
import Schema

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

public func makeLibraryListCellModels(context: Context) throws -> [[TableViewCellModel]]
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
