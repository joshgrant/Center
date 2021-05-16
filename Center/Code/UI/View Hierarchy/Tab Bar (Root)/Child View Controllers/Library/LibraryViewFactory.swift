//
//  LibraryListViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture
import Core

struct LibraryListViewFactory
{
    func makeTabBarItem() -> UITabBarItem
    {
        return UITabBarItem(
            title: "Library",
            image: Icon.library.getImage(),
            selectedImage: Icon.library.getImage())
    }
    
    func makeTableView() -> TableView
    {
        let tableView = TableView(frame: .zero, style: .grouped)
        
        return tableView
    }
}
