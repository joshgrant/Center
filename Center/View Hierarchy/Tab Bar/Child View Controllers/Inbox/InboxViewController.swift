//
//  InboxViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class InboxViewController: ViewController
{
    init(viewFactory: InboxViewFactoryProtocol)
    {
        super.init()
        self.tabBarItem = viewFactory.makeTabBarItem()
    }
}
