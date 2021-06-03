//
//  TabBarController.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

open class TabBarController: UITabBarController
{
    var _delegate: TabBarControllerDelegate!
    
    public init(delegate: TabBarControllerDelegate)
    {
        _delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
        
        self.delegate = _delegate
    }
    
    @available(*, unavailable)
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder)
    {
        fatalError("Load this view programmatically")
    }
}

func makeTabBarControllers(context: Context) -> [UIViewController]
{
    TabType.allCases.map {
        makeTabController(type: $0, context: context)
    }
}

//func makeViewController(tabBarItem: TabType, context: Context) -> UIViewController
//{
//    switch tabBarItem
//    {
//    case .dashboard:
//        return makeDashboardRootViewController(context: context)
//    case .library:
//        return makeLibraryRootViewController(context: context)
//    case .inbox:
//        return makeInboxRootViewController()
//    case .settings:
//        return makeSettingsRootViewController()
//    }
//}
