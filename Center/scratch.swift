//
//  scratch.swift
//  Center
//
//  Created by Joshua Grant on 10/9/20.
//

import UIKit
import CoreData

func makeTabBarControllers(appState: AppState, context: Context) -> [UIViewController]
{
    TabBarItem.allCases.map {
        makeViewController(tabBarItem: $0, appState: appState, context: context)
    }
}

func makeViewController(tabBarItem: TabBarItem, appState: AppState, context: Context) -> UIViewController
{
    switch tabBarItem
    {
    case .dashboard:
        return makeDashboardRootViewController(appState: appState, context: context)
    case .library:
        return makeLibraryRootViewController(context: context, appState: appState)
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
