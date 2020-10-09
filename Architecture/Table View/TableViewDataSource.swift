//
//  TableViewModel.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

public class TableViewDataSource: NSObject, UITableViewDataSource
{
    var model: TableViewDataSourceModel
    
    init(model: TableViewDataSourceModel)
    {
        self.model = model
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        model.numberOfRows.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        model.numberOfRows[section]
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellModel = model.cellModels[indexPath.section][indexPath.row]
        return makeCell(in: tableView, at: indexPath, with: cellModel)
    }
}
