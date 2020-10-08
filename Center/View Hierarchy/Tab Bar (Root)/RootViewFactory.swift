//
//  RootViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit
import CoreData
import Architecture

protocol RootViewFactoryProtocol
{
    func makeAllViewControllers() -> [UIViewController]
    func makeDashboardRootViewController() -> UIViewController
    func makeLibraryRootViewController() -> UIViewController
    func makeInboxRootViewController() -> UIViewController
    func makeSettingsRootViewController() -> UIViewController
}

struct RootViewFactory: RootViewFactoryProtocol
{
    var environment: RootEnvironment
    
    var dashboardEnvironment: DashboardEnvironment
    var libraryListEnvironment: LibraryListEnvironment
    
    init(environment: RootEnvironment)
    {
        self.environment = environment
        
        dashboardEnvironment = DashboardEnvironment(database: self.environment.database)
        libraryListEnvironment = LibraryListEnvironment(database: self.environment.database)
    }
    
    func makeAllViewControllers() -> [UIViewController]
    {
        return [
            makeDashboardRootViewController(),
            makeLibraryRootViewController(),
            makeInboxRootViewController(),
            makeSettingsRootViewController()
        ]
    }
    
    func makeDashboardRootViewController() -> UIViewController
    {
        let viewFactory = DashboardViewFactory(environment: dashboardEnvironment)
        let viewController = DashboardViewController(viewFactory: viewFactory)
        let navigationController = NavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func makeLibraryRootViewController() -> UIViewController
    {
        let viewFactory = LibraryListViewFactory(environment: libraryListEnvironment)
        let viewController = LibraryListViewController(viewFactory: viewFactory)
        let navigationController = NavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func makeInboxRootViewController() -> UIViewController
    {
        let viewFactory = InboxViewFactory()
        let viewController = InboxViewController(viewFactory: viewFactory)
        let navigationController = NavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func makeSettingsRootViewController() -> UIViewController
    {
        let viewFactory = SettingsViewFactory()
        let viewController = SettingsViewController(viewFactory: viewFactory)
        let navigationController = NavigationController(rootViewController: viewController)
        return navigationController
    }
}