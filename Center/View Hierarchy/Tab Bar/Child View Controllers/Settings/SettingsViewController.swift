//
//  SettingsViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

class SettingsViewController: ViewController
{
    init(viewFactory: SettingsViewFactoryProtocol)
    {
        super.init()
        self.tabBarItem = viewFactory.makeTabBarItem()
    }
}
