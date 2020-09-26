//
//  RootViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import Architecture

protocol RootViewFactoryProtocol
{
    func makeAllViewControllers() -> [ViewController]
    func makeDashboardViewController() -> ViewController
    func makeLibraryViewController() -> ViewController
    func makeInboxViewController() -> ViewController
    func makeSettingsViewController() -> ViewController
}

struct RootViewFactory: RootViewFactoryProtocol {
    
    func makeAllViewControllers() -> [ViewController] {
        return [
            makeDashboardViewController(),
            makeLibraryViewController(),
            makeInboxViewController(),
            makeSettingsViewController()
        ]
    }
    
    func makeDashboardViewController() -> ViewController {
        let viewFactory = DashboardViewFactory()
        return DashboardViewController(viewFactory: viewFactory)
    }
    
    func makeLibraryViewController() -> ViewController {
        let viewFactory = LibraryViewFactory()
        return LibraryViewController(viewFactory: viewFactory)
    }
    
    func makeInboxViewController() -> ViewController {
        let viewFactory = InboxViewFactory()
        return InboxViewController(viewFactory: viewFactory)
    }
    
    func makeSettingsViewController() -> ViewController {
        let viewFactory = SettingsViewFactory()
        return SettingsViewController(viewFactory: viewFactory)
    }
}
