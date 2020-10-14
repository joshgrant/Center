//
//  TitleEditCellModel.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import Foundation

struct TitleEditCellModel
{
    var text: String?
    var placeholder: String
}

extension TitleEditCellModel: TableViewCellModel
{
    static var cellClass: AnyClass {
        TitleEditCell.self
    }
}
