//
//  SettingsController.swift
//  Center
//
//  Created by Joshua Grant on 5/27/21.
//

import UIKit

func makeSettingsRootViewController() -> UIViewController
{
    let controller = ViewController()
    controller.tabBarItem = makeUITabBarItem(tabBarItem: .settings)
    controller.title = title(tabBarItem: .settings)
    return controller
}
