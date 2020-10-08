//
//  PinnedListCellModel.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import Schema

struct PinnedListCellModel
{
    var title: String
}

extension PinnedListCellModel: TableViewCellModel
{
    static var cellClass: AnyClass {
        PinnedListCell.self
    }
}

extension PinnedListCellModel
{
    static func pinnedCellModels(from entities: [Entity]) -> [PinnedListCellModel]
    {
        entities.map {
            PinnedListCellModel(title: $0.title)
        }
    }
}
