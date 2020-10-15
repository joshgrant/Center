//
//  TableViewDelegate.swift
//  Architecture
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

public class TableViewDelegate: NSObject, UITableViewDelegate
{
    var model: TableViewDelegateModel
    
    init(model: TableViewDelegateModel)
    {
        self.model = model
    }
}

public extension TableViewDelegate
{
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
    {
        model.estimatedSectionHeaderHeights?[section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        model.sectionHeaderHeights?[section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        model.headerViews?[section]
    }
}

public extension TableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let tableViewSelection = TableViewSelection(
            tableView: tableView,
            indexPath: indexPath)
        let newAppState = model.didSelect?(tableViewSelection)
        print(newAppState!)
    }
}
