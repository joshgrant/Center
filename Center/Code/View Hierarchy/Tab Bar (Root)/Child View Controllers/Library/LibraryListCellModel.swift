//
//  LibraryCellModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import UIKit

public struct LibraryCellModel
{
    var image: UIImage?
    var title: String
    var count: Int
}

extension LibraryCellModel: TableViewCellModel
{
    public static var cellClass: AnyClass {
        LibraryCell.self
    }
}
