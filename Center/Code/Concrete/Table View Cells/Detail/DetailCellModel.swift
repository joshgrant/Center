//
//  DetailCellModel.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import Foundation

struct DetailCellModel
{
    var title: String
    var detail: String
}

extension DetailCellModel: TableViewCellModel
{
    static var cellClass: AnyClass {
        DetailCell.self
    }
}
