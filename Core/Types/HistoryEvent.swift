//
//  HistoryEvent.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc public enum HistoryEvent: Int, RealmEnum
{
    case created
    case updated
    case deleted
}