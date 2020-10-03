//
//  RDimension.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RDimension: Object,
                       Dimension,
                       RUnitStorage,
                       RNoteStorage
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    
    public let _units = List<RUnit>()
    public let _notes = List<RNote>()

    // TODO: Cache
    public func unitsCount() -> Int
    {
        _units.count
    }
}
