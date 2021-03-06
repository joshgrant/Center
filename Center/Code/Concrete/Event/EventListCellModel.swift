//
//  EventListCellModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

struct EventListCellModel
{
    var title: String
    var detail: String
}

extension EventListCellModel: TableViewCellModel
{
    static var cellClass: AnyClass {
        EventListCell.self
    }
}

extension EventListCellModel
{
    static func eventCellModelsFrom(events: [Event]) -> [EventListCellModel]
    {
        events.map {
            let title = $0.unwrappedName ?? ""
            return EventListCellModel(title: title, detail: "Mon, Apr 3")
        }
    }
}
