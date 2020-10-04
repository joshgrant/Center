//
//  RState.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RState: Object, State
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    @objc dynamic public var name: String?
    @objc dynamic public var min: Double = 0
    @objc dynamic public var max: Double = 0
    
    public var ideals = LinkingObjects(fromType: RIdeal.self, property: "state")
}
