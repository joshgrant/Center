//
//  RIdeal.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RIdeal: Object, Ideal
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var idealType: IdealType = .value
    @objc dynamic public var state: State?
    
    public var stocks = LinkingObjects(fromType: RStock.self, property: "ideal")
}
