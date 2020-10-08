//
//  TableViewCellModel.swift
//  Architecture
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

public protocol TableViewCellModel
{
    static var cellClass: AnyClass { get }
    static var cellReuseIdentifier: String { get }
}

public extension TableViewCellModel
{
    static var cellReuseIdentifier: String
    {
        String(describing: cellClass)
    }
}
