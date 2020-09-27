//
//  TableViewCellModel.swift
//  Architecture
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

public protocol TableViewCellModel
{
    var cellClass: AnyClass { get }
    var cellReuseIdentifier: String { get }
}

public extension TableViewCellModel
{
    var cellReuseIdentifier: String
    {
        String(describing: cellClass)
    }
}
