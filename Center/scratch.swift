//
//  scratch.swift
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
    controller.title = title(tabBarItem: .inbox)
    return controller
}

// SETTINGS

func makeSettingsRootViewController() -> UIViewController
{
    let controller = ViewController()
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .settings)
    controller.title = title(tabBarItem: .settings)
    return controller
}

//////

func createContext() -> Context
{
    var container = try! makeContainer(modelName: "Model")
    container = try! loadPersistentStores(on: container)
    let _context = context(from: container)
    populateDatabaseWithWaterSystem(context: _context)
    populateDatabaseWithBirthdayPartyEvent(context: _context)
    return _context
}

extension Bundle
{
    var activityType: String
    {
        Bundle
            .main
            .infoDictionary?["NSUserActivityTypes"]
            .flatMap { ($0 as? [String])?.first }
            ?? ""
    }
}
