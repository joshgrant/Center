//
//  PinnedListCellModel.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

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
        entities.compactMap {
            if let entity = $0 as? Named {
                return PinnedListCellModel(title: entity.title)
            } else {
                assertionFailure("We shouldn't be able to pin non-named entities.")
                return nil
            }
        }
    }
}
