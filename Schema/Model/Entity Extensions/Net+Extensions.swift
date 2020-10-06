//
//  Net+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension Net
{
    var timePeriodType: TimePeriod {
        get {
            TimePeriod(rawValue: timePeriodTypeRaw) ?? .fallback
        }
        set {
            timePeriodTypeRaw = newValue.rawValue
        }
    }
}
