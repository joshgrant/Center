//
//  TimePeriod.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

public enum TimePeriod: Int16
{
    case millisecond
    case second
    case minute
    case hour
    case day
    case week
    case month
    case year
}

extension TimePeriod: FallbackProtocol
{
    static let fallback: TimePeriod = .hour
}
