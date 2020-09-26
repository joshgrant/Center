//
//  DashboardViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

protocol DashboardViewFactoryProtocol: TabBarItemFactoryProtocol
{
    func makeTableView() -> TableView
}

struct DashboardViewFactory: DashboardViewFactoryProtocol
{
    func makeTabBarItem() -> UITabBarItem
    {
        return UITabBarItem(
            title: "Dashboard",
            image: Icon.dashboard.getImage(),
            selectedImage: Icon.dashboard.getImage())
    }
    
    func makeTableView() -> TableView
    {
        let tableView = TableView()
        
        let delegateDataSource = DashboardDelegateDataSource()
        delegateDataSource.configure(tableView: tableView)
        
        return tableView
    }
}
