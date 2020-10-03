//
//  Event.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Event:
    Entity,
    Named,
    FlowStorage,
    HistoryStorage,
    ConditionStorage
{
    var isActive: Bool { get set }
}
