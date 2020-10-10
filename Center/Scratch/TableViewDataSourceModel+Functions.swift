//
//  TableViewDataSourceModel+Functions.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import Foundation

public func numberOfRows(tableViewDataSourceModel: TableViewDataSourceModel) -> [Int]
{
    tableViewDataSourceModel.cellModels.map {
        $0.count
    }
}
