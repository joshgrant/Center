//
//  RNet.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RNet: Object, Net
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var timePeriod: TimePeriod = .day
    @objc dynamic public var amount: Double = 0
}
