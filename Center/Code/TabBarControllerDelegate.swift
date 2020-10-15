//
//  TabBarControllerDelegate.swift
//  Center
//
//  Created by Joshua Grant on 10/15/20.
//

import UIKit

open class TabBarControllerDelegate: NSObject, UITabBarControllerDelegate
{
    weak var appState: AppState?
    
    init(appState: AppState)
    {
        self.appState = appState
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        //        Make the valid state transition if necessary
        guard let tab = tabFor(viewController: viewController) else {
            return
        }
        let state = viewState(forTabBarItem: tab)
        appState?.viewState = state // TODO: Not the ideal transition type...
    }
    
    public func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController) -> Bool
    {
        // Check the app state to see if we can make a valid transition
        guard let tab = tabFor(viewController: viewController) else {
            return false
        }
        let state = viewState(forTabBarItem: tab)
        return appState?.canTransition(to: state) ?? false
    }
}

// This assumes the title on the view controller is set properly...
public func tabFor(viewController: UIViewController) -> TabBarItem?
{
    var viewController: UIViewController? = viewController
    
    if let controller = viewController as? UINavigationController
    {
        viewController = controller.children.first
    }
    
    switch viewController?.tabBarItem.title
    {
    case title(tabBarItem: .dashboard):
        return .dashboard
    case title(tabBarItem: .library):
        return .library
    case title(tabBarItem: .inbox):
        return .inbox
    case title(tabBarItem: .settings):
        return .settings
    default:
        assertionFailure("Failed to get the tab for the view controller: \(viewController)")
        return nil
    }
}

public func viewState(forTabBarItem item: TabBarItem) -> ViewState
{
    switch item
    {
    case .dashboard:
        return ViewState.dashboard
    case .library:
        return ViewState.library
    case .inbox:
        return ViewState.inbox
    case .settings:
        return ViewState.settings
    }
}
