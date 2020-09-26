//
//  DashboardDelegateDataSource.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

// Of course, for a table view, the delegate/datasource is the model...
// Where does the underlying data come from? A data store... which just needs
// to follow some sort of protocol

class DashboardDelegateDataSource: NSObject, TableViewModel
{
    static func cellClassAndReuseIdentifiers() -> [TableViewCellClassReuseIdentifier] {
        return []
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
