//
//  History.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc protocol History
{
    var date: Date { get set }
    var event: HistoryEvent { get set }
}

@objc enum HistoryEvent: Int, RealmEnum
{
    case created
    case updated
    case deleted
}
