//
//  DashboardViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

class DashboardViewController: ViewController
{
    init(viewFactory: DashboardViewFactoryProtocol) {
        super.init()
        
        self.tabBarItem = viewFactory.makeTabBarItem()
    }
}
