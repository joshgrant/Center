//
//  RTransferFlow.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation
import RealmSwift

open class RTransferFlow: RFlow, TransferFlow
{
    @objc dynamic public var amount: Double = 0
    @objc dynamic public var from: Stock?
    @objc dynamic public var to: Stock?
    @objc dynamic public var duration: TimeInterval = 0
    @objc dynamic public var delay: TimeInterval = 0
    @objc dynamic public var requiresUserCompletion: Bool = true
}
