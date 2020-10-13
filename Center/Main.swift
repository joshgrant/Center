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
