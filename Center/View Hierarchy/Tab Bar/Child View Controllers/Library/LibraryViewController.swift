//
//  LibraryViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

class LibraryViewController: ViewController
{
    init(viewFactory: LibraryViewFactoryProtocol)
    {
        super.init()
        self.tabBarItem = viewFactory.makeTabBarItem()
        
        self.navigationItem.searchController = UISearchController()
    }
}
