//
//  LibraryList.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import UIKit

func makeLibraryRootViewController(context: Context) -> UIViewController
{
    let controller = ViewController()
    
    let didSelect: TableViewSelectionClosure = { selection in
        
        guard let entityType = EntityType(rawValue: selection.indexPath.row) else {
            assertionFailure("Failed to create an `EntityType` from a selection's indexPath.row")
            return
        }
        
        if let detailViewController = makeViewController(entityType: entityType, context: context)
        {
            controller
                .navigationController?
                .pushViewController(detailViewController, animated: true)
        }
    }
    
    let tableViewModel = makeLibraryListTableViewModel(context: context, didSelect: didSelect)
    let tableView = makeTableView(from: tableViewModel)
    
    controller.view = tableView
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .library)
    
    let navigationController = NavigationController(rootViewController: controller)
    return navigationController
}

func makeLibraryListTableDelegate(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegate
{
    let model = TableViewDelegateModel(
        headerViews: nil,
        sectionHeaderHeights: nil,
        estimatedSectionHeaderHeights: nil,
        didSelect: didSelect)
    
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

func makeLibraryListTableViewModel(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeLibraryListTableDelegate(context: context, didSelect: didSelect),
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
