//
//  NoteListCellModel.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

struct NoteListCellModel
{
    var title: String
    var subtitle: String
}

extension NoteListCellModel: TableViewCellModel
{
    static var cellClass: AnyClass {
        NoteListCell.self
    }
}
