//
//  Library.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import UIKit

func makeLibraryRootViewControllerSelectionClosure(context: Context, controller: ViewController, appState: AppState) -> TableViewSelectionClosure
{
    return { selection in
        
        guard let entityType = EntityType(rawValue: selection.indexPath.row) else {
            assertionFailure("Failed to create an `EntityType` from a selection's indexPath.row")
            return appState
        }
        
        if let detailViewController = makeViewController(entityType: entityType, context: context, appState: appState)
        {
            controller
                .navigationController?
                .pushViewController(detailViewController, animated: true)
        }
        
        selection.tableView.deselectRow(at: selection.indexPath, animated: true)
        
        // TODO: Use a state change to the app state, rather than the above statements
        return appState
    }
}

func makeLibraryRootViewController(context: Context, appState: AppState) -> UIViewController
{
    let controller = ViewController()
    
    let didSelect = makeLibraryRootViewControllerSelectionClosure(
        context: context,
        controller: controller,
        appState: appState)
    let tableViewModel = makeLibraryTableViewModel(
        context: context,
        didSelect: didSelect)
    let tableView = makeTableView(from: tableViewModel)
    
    controller.view = tableView
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .library)
    
    let delegate = LibrarySearchBarDelegate()
    let searchController = makeSearchController(searchBarDelegate: delegate)
    controller.navigationItem.searchController = searchController
    controller.navigationItem.hidesSearchBarWhenScrolling = true
    controller.title = title(tabBarItem: .library)
    
    let navigationController = NavigationController(rootViewController: controller)
    return navigationController
}

func makeLibraryTableDelegate(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewDelegate
{
    let model = TableViewDelegateModel(
        headerViews: nil,
        sectionHeaderHeights: nil,
        estimatedSectionHeaderHeights: nil,
        didSelect: didSelect)
    
    return TableViewDelegate(model: model)
}

func makeLibraryTableDataSource(context: Context) -> TableViewDataSource
{
    let data = makeLibraryTableData(context: context)
    return makeTableViewDataSource(with: data)
}

func makeLibraryTableViewCellModelTypes() -> [TableViewCellModel.Type]
{
    [LibraryCellModel.self]
}

func makeLibraryTableData(context: Context) -> TableViewDataSourceModel
{
    let models = makeLibraryCellModels(context: context)
    return TableViewDataSourceModel(cellModels: models)
}

func makeLibraryTableViewModel(context: Context, didSelect: @escaping TableViewSelectionClosure) -> TableViewModel
{
    TableViewModel(
        style: .grouped,
        delegate: makeLibraryTableDelegate(context: context, didSelect: didSelect),
        dataSource: makeLibraryTableDataSource(context: context),
        cellModelTypes: makeLibraryTableViewCellModelTypes())
}

public func makeLibraryCellModels(context: Context) -> [[TableViewCellModel]]
{
    let cellModels = EntityType.allCases.map {
        makeLibraryCellModel(for: $0, context: context)
    }
    
    return [cellModels]
}

func makeLibraryCellModel(for entityType: EntityType, context: Context) -> LibraryCellModel
{
    LibraryCellModel(
        image: imageForEntityType(entityType),
        title: titleForEntityType(entityType),
        count: countForEntityType(entityType, context: context))
}
