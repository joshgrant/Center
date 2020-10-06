//
//  History+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension History
{
    var eventType: HistoryEvent {
        get {
            HistoryEvent(rawValue: eventTypeRaw) ?? .fallback
        }
        set {
            eventTypeRaw = newValue.rawValue
        }
    }
}
