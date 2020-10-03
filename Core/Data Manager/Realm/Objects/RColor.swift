//
//  RColor.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RColor: Object, Color
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    @objc dynamic public var hue: Double = 0.0
    @objc dynamic public var saturation: Double = 1.0
    @objc dynamic public var brightness: Double = 1.0
}
