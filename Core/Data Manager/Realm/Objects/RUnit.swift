//
//  RUnit.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RUnit: Object, Unit, RNoteStorage
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    @objc dynamic public var isBaseUnit: Bool = true
    @objc dynamic public var relativeTo: Unit?
    @objc dynamic public var ratio: Ratio?
    
    public let _notes = List<RNote>()
}
