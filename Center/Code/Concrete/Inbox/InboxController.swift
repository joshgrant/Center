//
//  InboxController.swift
//  Center
//
//  Created by Joshua Grant on 5/27/21.
//

import UIKit

func makeInboxRootViewController() -> UIViewController
{
    let controller = ViewController()
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .inbox)
    controller.title = title(tabBarItem: .inbox)
    return controller
}
