//
//  TableViewDelegate.swift
//  Architecture
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

public typealias TableViewDelegateType =
    NSObject
    & UITableViewDelegate

public protocol TableViewDelegate: TableViewDelegateType
{
    func configure(tableView: TableView)
}

public extension TableViewDelegate
{
    func configure(tableView: TableView)
    {
        tableView.delegate = self
    }
}
