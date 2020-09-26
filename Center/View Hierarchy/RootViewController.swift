//
//  RootViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

struct TabBarViewControllerFactory {
    
    public static func makeAllViewControllers() -> [ViewController] {
        return [
            makeDashboardViewController(),
            makeLibraryViewController(),
            makeInboxViewController(),
            makeSettingsViewController()
        ]
    }
    
    public static func makeDashboardViewController() -> ViewController {
        let viewFactory = DashboardViewFactory()
        return DashboardViewController(viewFactory: viewFactory)
    }
    
    public static func makeLibraryViewController() -> ViewController {
        return LibraryViewController()
    }
    
    public static func makeInboxViewController() -> ViewController {
        return InboxViewController()
    }
    
    public static func makeSettingsViewController() -> ViewController {
        return SettingsViewController()
    }
}

class RootViewController: TabBarController {
    
    override init() {
        super.init()
        
        view.backgroundColor = .white
        viewControllers = TabBarViewControllerFactory.makeAllViewControllers()
    }
}
