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
public func tabFor(viewController: UIViewController) -> TabType?
{
    var viewController: UIViewController? = viewController
    
    if let controller = viewController as? UINavigationController
    {
        viewController = controller.children.first
    }
    
    switch viewController?.tabBarItem.title
    {
    case TabType.dashboard.title:
        return .dashboard
    case TabType.library.title:
        return .library
    case TabType.inbox.title:
        return .inbox
    case TabType.settings.title:
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
