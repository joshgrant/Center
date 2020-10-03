//
//  TransferFlow.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol TransferFlow: Flow
{
    var amount: Double { get set }
    var from: Stock? { get set }
    var to: Stock? { get set }
    var duration: TimeInterval { get set }
    var delay: TimeInterval { get set }
    var requiresUserCompletion: Bool { get set }
}
