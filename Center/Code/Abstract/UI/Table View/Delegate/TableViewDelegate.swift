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
        guard let headerViews = model.headerViews else {
            return nil
        }
        
        if headerViews.count > section {
            return headerViews[section]
        } else {
            return nil
        }
    }
}

public extension TableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let tableViewSelection = TableViewSelection(
            tableView: tableView,
            indexPath: indexPath)
        if let newAppState = model.didSelect?(tableViewSelection) {
            print(newAppState)
        } else {
            print("Selected row, but no new state")
        }
    }
}
