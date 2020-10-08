//
//  LibraryListCellModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import UIKit
import Schema
import Architecture

public struct LibraryListCellModel
{
    var image: UIImage?
    var title: String
    var count: Int
}

extension LibraryListCellModel: TableViewCellModel
{
    public static var cellClass: AnyClass {
        LibraryListCell.self
    }
}
