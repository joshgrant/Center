//
//  TableViewDelegateModel.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import UIKit

// TODO: Maybe make this more generic, i.e table view update closure
// and have all of the delegate methods call the closure, with different
// parameters. Maybe represent the update type with a struct...
typealias TableViewSelectionClosure = ((TableViewSelection) -> AppState)

public struct TableViewSelection
{
    var tableView: UITableView
    var indexPath: IndexPath
}

public struct TableViewDelegateModel
{
    var headerViews: [UIView?]?
    var sectionHeaderHeights: [CGFloat]?
    var estimatedSectionHeaderHeights: [CGFloat]?
    var didSelect: TableViewSelectionClosure?
}
