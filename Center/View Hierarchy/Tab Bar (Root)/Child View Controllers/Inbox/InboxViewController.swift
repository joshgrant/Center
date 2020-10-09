//
//  InboxViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

class InboxViewController: ViewController
{
    init(viewFactory: InboxViewFactory)
    {
        super.init()
        self.tabBarItem = TabBarItem.inbox.makeUITabBarItem()
    }
}
