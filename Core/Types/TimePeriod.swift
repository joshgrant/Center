//
//  TimePeriod.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc public enum TimePeriod: Int, RealmEnum
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
