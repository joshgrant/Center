//
//  TableViewModel.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

public typealias TableViewModelType =
    NSObject
    & UITableViewDelegate
    & UITableViewDataSource

public struct TableViewCellClassReuseIdentifier
{
    var cellClass: AnyClass?
    var cellReuseIdentifier: String
}

public protocol TableViewModel: NSObject, UITableViewDelegate, UITableViewDataSource
{
    func configure(tableView: TableView)
    static func cellClassAndReuseIdentifiers() -> [TableViewCellClassReuseIdentifier]
}

public extension TableViewModel
{
    func configure(tableView: TableView) {
        tableView.delegate = self
        tableView.dataSource = self
        
        Self.cellClassAndReuseIdentifiers().forEach { pair in
            tableView.register(pair.cellClass, forCellReuseIdentifier: pair.cellReuseIdentifier)
        }
    }
}
