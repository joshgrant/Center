//
//  Main.swift
//  Center
//
//  Created by Joshua Grant on 10/9/20.
//

import UIKit
import CoreData

func makeTabBarControllers(context: Context) -> [UIViewController]
{
    TabBarItem.allCases.map {
        makeViewController(tabBarItem: $0, context: context)
    }
}

func makeViewController(tabBarItem: TabBarItem, context: Context) -> UIViewController
{
    switch tabBarItem
    {
    case .dashboard:
        return makeDashboardRootViewController(context: context)
    case .library:
        return makeLibraryRootViewController(context: context)
    case .inbox:
        return makeInboxRootViewController()
    case .settings:
        return makeSettingsRootViewController()
    }
}

// INBOX

func makeInboxRootViewController() -> UIViewController
{
    let controller = ViewController()
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .inbox)
    return controller
}

// SETTINGS

func makeSettingsRootViewController() -> UIViewController
{
    let controller = ViewController()
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .settings)
    return controller
}

//////

func makeSystemsListTableViewDelegate() -> TableViewDelegate
{
    let delegateModel = TableViewDelegateModel(
        headerViews: nil,
        sectionHeaderHeights: nil,
        estimatedSectionHeaderHeights: nil)
    return TableViewDelegate(model: delegateModel)
}

func makeSystemsListTableViewCellModels(context: Context) -> [[TableViewCellModel]]
{
    let fetchRequest: NSFetchRequest<System> = System.fetchRequest()
    do {
        let results = try context.fetch(fetchRequest)
        let cells = results.map { system -> SystemListCellModel in
            let ideal = system.ideal?.computedValue as? Double ?? 0
            return SystemListCellModel(title: system.title, percentIdeal: ideal)
        }
        return [cells]
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}

func makeSystemsListTableViewDataSource(context: Context) -> TableViewDataSource
{
    let cellModels = makeSystemsListTableViewCellModels(context: context)
    let dataSourceModel = TableViewDataSourceModel(cellModels: cellModels)
    return TableViewDataSource(model: dataSourceModel)
}

func makeSystemsListCellModelTypes() -> [TableViewCellModel.Type]
{
    [SystemListCellModel.self]
}

func makeSystemsListTableViewModel(context: Context) -> TableViewModel
{
    TableViewModel(
        delegate: makeSystemsListTableViewDelegate(),
        dataSource: makeSystemsListTableViewDataSource(context: context),
        cellModelTypes: makeSystemsListCellModelTypes())
}

func makeSystemsListPage(context: Context) -> ViewController
{
    let model = makeSystemsListTableViewModel(context: context)
    let tableView = makeTableView(from: model)
    
    let controller = ViewController()
    controller.view = tableView
    
    return controller
}
