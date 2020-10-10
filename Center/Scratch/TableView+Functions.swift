//
//  TableView.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import Foundation

public func makeTableView(from tableViewModel: TableViewModel) -> TableView
{
    let tableView = TableView(frame: .zero, style: tableViewModel.style)
    
    tableView.delegate = tableViewModel.delegate
    tableView.dataSource = tableViewModel.dataSource
    
    tableViewModel.cellModelTypes.forEach {
        tableView.register($0.cellClass, forCellReuseIdentifier: $0.cellReuseIdentifier)
    }
    
    return tableView
}
