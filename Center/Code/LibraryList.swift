//
//  LibraryList.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import Foundation

func makeLibraryListTableDelegate(context: Context) -> TableViewDelegate
{
    let model = TableViewDelegateModel(
        headerViews: nil,
        sectionHeaderHeights: nil,
        estimatedSectionHeaderHeights: nil)
    return TableViewDelegate(model: model)
}

func makeLibraryListTableDataSource(context: Context) -> TableViewDataSource
{
    let data = makeLibraryListTableData(context: context)
    return makeTableViewDataSource(with: data)
}

func makeLibraryListTableViewCellModelTypes() -> [TableViewCellModel.Type]
{
    [LibraryListCellModel.self]
}

func makeLibraryListTableData(context: Context) -> TableViewDataSourceModel
{
    let models = makeLibraryListCellModels(context: context)
    return TableViewDataSourceModel(cellModels: models)
}

func makeLibraryListTableViewModel(context: Context) -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeLibraryListTableDelegate(context: context),
        dataSource: makeLibraryListTableDataSource(context: context),
        cellModelTypes: makeLibraryListTableViewCellModelTypes())
}

public func makeLibraryListCellModels(context: Context) -> [[TableViewCellModel]]
{
    let cellModels = EntityType.allCases.map {
        makeLibraryListCellModel(for: $0, context: context)
    }
    
    return [cellModels]
}

func makeLibraryListCellModel(for entityType: EntityType, context: Context) -> LibraryListCellModel
{
    LibraryListCellModel(
        image: imageForEntityType(entityType),
        title: titleForEntityType(entityType),
        count: countForEntityType(entityType, context: context))
}
