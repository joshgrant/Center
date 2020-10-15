//
//  TabBarControllerDelegate.swift
//  Center
//
//  Created by Joshua Grant on 10/15/20.
//

import UIKit

typealias ShouldSelectTab = ((_ tabBarController: UITabBarController,
                           _ viewController: UIViewController) -> Bool)
typealias DidSelectTab = ((_ tabBarController: UITabBarController,
                           _ viewController: UIViewController) -> Void)

open class TabBarControllerDelegate: NSObject, UITabBarControllerDelegate
{
    var shouldSelect: ShouldSelectTab?
    var didSelect: DidSelectTab?
    
    init(shouldSelect: ShouldSelectTab?, didSelect: DidSelectTab?)
    {
        self.shouldSelect = shouldSelect
        self.didSelect = didSelect
    }
    
    public func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController) -> Bool
    {
        return shouldSelect?(tabBarController, viewController) ?? false
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        didSelect?(tabBarController, viewController)
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
        if let viewController = viewController
        {
            assertionFailure("The view controller was nil: \(viewController)")
        }
        else
        {
            assertionFailure("The view controller was nil")
        }
        return nil
    }
}

public func state(forTabBarItem item: TabBarItem) -> Any
{
    switch item
    {
    case .dashboard:
        return DashboardState()
    case .library:
        return LibraryState()
    case .inbox:
        return InboxState()
    case .settings:
        return SettingsState()
    }
}
