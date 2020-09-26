//
//  DashboardViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

protocol DashboardViewFactoryProtocol
{
    func makeTabBarItem() -> UITabBarItem
    func makeTableView() -> TableView
}

struct DashboardViewFactory: DashboardViewFactoryProtocol
{
    func makeTabBarItem() -> UITabBarItem
    {
        return UITabBarItem(
            title: "Dashboard",
            image: UIImage(systemName: "speedometer"),
            selectedImage: UIImage(systemName: "speedometer"))
    }
    
    func makeTableView() -> TableView
    {
        let tableView = TableView()
        
        let delegateDataSource = DashboardDelegateDataSource()
        delegateDataSource.configure(tableView: tableView)
        
        return tableView
    }
}
