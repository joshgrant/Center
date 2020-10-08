//
//  LibraryListTableViewDataSource.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import UIKit
import Schema

class LibraryListTableViewDataSource: NSObject, TableViewDataSource
{
    var cellModelFactory: LibraryListCellModelFactory
    
    init(cellModelFactory: LibraryListCellModelFactory)
    {
        self.cellModelFactory = cellModelFactory
    }
    
    func cellClassAndReuseIdentifiers() -> [TableViewCellModel.Type]
    {
        [
            LibraryListCellModel.self
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        EntityType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let model = cellModelFactory.makeCellModels()[indexPath.section][indexPath.row]
        let identifier = type(of: model).cellReuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let cell = cell as? TableViewCell
        {
            cell.configureWithViewModel(model)
        }
        
        return cell
    }
}
