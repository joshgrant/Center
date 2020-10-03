//
//  History.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol History: Entity
{
    var amount: Double { get set }
    var date: Date { get set }
    var event: HistoryEvent { get set }
}
