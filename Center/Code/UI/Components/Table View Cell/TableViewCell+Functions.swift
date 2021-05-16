//
//  TableViewCell.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import Foundation
import UIKit

func makeCell(
    in tableView: UITableView,
    at indexPath: IndexPath,
    with model: TableViewCellModel) -> UITableViewCell
{
    let identifier = type(of: model).cellReuseIdentifier
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    
    if let cell = cell as? TableViewCell
    {
        cell.configureWithViewModel(model)
    }
    
    return cell
}
