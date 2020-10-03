//
//  RRatio.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RRatio: Object, Ratio
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var left: Double = 0
    @objc dynamic public var right: Double = 0
}
