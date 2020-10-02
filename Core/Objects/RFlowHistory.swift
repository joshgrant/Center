//
//  RFlowHistory.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RFlowHistory: Object, FlowHistory
{
    @objc dynamic public var amount: Double = 0.0
}
