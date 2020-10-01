//
//  History.swift
//  Center
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation
import RealmSwift

class History: Object, Codable
{
    var historyEvents = List<HistoryEvent>()
}

class HistoryEvent: Object, Codable
{
    @objc dynamic var date = Date()
    @objc dynamic var type = HistoryEventType.created
}

@objc enum HistoryEventType: Int, RealmEnum, Codable
{
    case created
    case updated
    case deleted
}
