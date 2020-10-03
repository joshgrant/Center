//
//  RConversion.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RConversion: Object, Conversion
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var from: Symbol?
    @objc dynamic public var to: Symbol?
    @objc dynamic public var ratio: Ratio?
    @objc dynamic public var isReversible: Bool = true
}