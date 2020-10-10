//
//  TableViewModel.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import UIKit

public struct TableViewModel
{
    var style: UITableView.Style = .grouped
    
    var delegate: TableViewDelegate
    var dataSource: TableViewDataSource
    
    var cellModelTypes: [TableViewCellModel.Type]
}
