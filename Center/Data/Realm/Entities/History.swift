//
//  History.swift
//  Center
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation
import RealmSwift

class History: Object
{
    let historyevents = List<HistoryEvent>()
}

class HistoryEvent: Object
{
    @objc dynamic var date = Date()
    @objc dynamic var type = HistoryEventType.created
}

@objc enum HistoryEventType: Int, RealmEnum
{
    case created
    case updated
    case deleted
}
