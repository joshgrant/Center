//
//  Net.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Net: Entity
{
    var timePeriod: TimePeriod { get set }
    var amount: Double { get set }
}
