//
//  TableViewModel.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

public typealias TableViewDataSourceType =
    NSObject
    & UITableViewDataSource

public protocol TableViewDataSource: TableViewDataSourceType
{
    func configure(tableView: TableView)
    func cellClassAndReuseIdentifiers() -> [TableViewCellModel]
}

public extension TableViewDataSource
{
    func configure(tableView: TableView)
    {
        tableView.dataSource = self
        
        cellClassAndReuseIdentifiers().forEach { pair in
            tableView.register(pair.cellClass, forCellReuseIdentifier: pair.cellReuseIdentifier)
        }
    }
}
